Attribute VB_Name = "StateMachine"
Option Explicit
'==========================
' Private Variables
'==========================
Private TimerHandler As Long
Private StepNumber As Integer

'===================================================================
' State Machine Step Definitions
' Step 0 = Machine Inizialitation (Reinizialition)
' Step 1 = Vefify if the Operator has select the Typenumber and TypeVar
' Step 2 = Read Scaneer (Operator)
' Step 3 = Send PartReceived Telegram to MES
' Step 4 = Verifiying information of the Received Telegram MES
' Step 5 = Send to MES the telegram PartProcessing Start
' Step 6 = Refifiying information of the Received Telegram MES
' Step 7 = Print Label In Zebra Printer
'===================================================================

'==========================
' State Machine Control Start/Stop
'==========================
Public Function StartStateMachine()
    'Reset the State Machine to Step 0
    StepNumber = 0
    
    'To start the timer:
    'TimerHandler = SetTimer(0, 0, 200, AddressOf TimerProc)
    frmMain.tmrUpdateStateMachine.Enabled = True
End Function

Public Function StopStateMachine()
    'To stop the timer:
    'KillTimer 0, TimerHandler
    frmMain.tmrUpdateStateMachine.Enabled = False
End Function

'==========================
' State Machine Procedures
'==========================

Private Sub TimerProc(ByVal hwnd As Long, _
                      ByVal lMsg As Long, _
                      ByVal lTimerID As Long, _
                      ByVal lTimer As Long)
    UpdateStateMachine
End Sub

Public Function UpdateGUI()
    frmMain.txtSN.text = machine.SerialNumber
    frmMain.txtcounter.text = Str(machine.GoodParts)
    frmMain.txtbadunits.text = Str(machine.BadParts)
    
    frmMain.txtModel.text = machine.TypeNumber
    frmMain.txtTypeVar.text = machine.typevar
    
    If machine.SocketConnected = True Then
        frmMain.lblAMS.Visible = False
    Else
        frmMain.lblAMS.Visible = True
    End If
    
    If StepNumber < 3 Then
        frmMain.btnUtils.Enabled = True
        frmMain.btnChangeModel.Enabled = True
    Else
        frmMain.btnUtils.Enabled = False
        frmMain.btnChangeModel.Enabled = False
    End If
    
End Function

Public Function UpdateStateMachine()
    UpdateGUI
    
    Select Case StepNumber
        Case 0
            ' Checks that the Operator has selected the correct Information
            frmMain.txtOperador.text = "Se necesita estar Conectado a sistemas MES"
            If machine.SocketConnected Then
                StepNumber = 1
            End If
        Case 1
            ' Checks that the Operator has selected the correct Information
            If Len(machine.TypeNumber) > 0 Then
                StepNumber = 2
            Else
                frmMain.txtOperador.text = "Seleccione Numero de Parte"
                machine.SerialNumber = ""
            End If
        Case 2
            frmMain.txtOperador.text = "Escanee Numero de Serie"
            If machine.comScanner.GetAvailableBytes >= machine.SerialNumberLength Then
                Dim result As Boolean
                ' Reads the data in the scanner and stores them
                ' in SerialNumber
                ' This function will return true in the data has
                ' has been correct
                
                result = machine.ReadFromScanner ' Read The scanner Data
                If result = True Then
                    StepNumber = 3
                    UpdateGUI
                Else
                    StepNumber = 0
                End If
                
            End If
        Case 3
            frmMain.txtOperador.text = "Enviando PartReceived a Sistema MES"
            SendPartReceive
            StepNumber = 4
            
        Case 4
            frmMain.txtOperador.text = "Esperando Respuesta PartReceived de MES"
            If machine.SocketAvailable Then
                If ReadPartReceive = True Then
                    StepNumber = 7
                Else
                    frmMain.txtOperador.text = "Error: esta pieza no debe ser procesda en esta estacion"
                    DoEvents
                    Sleep 3000
                    StepNumber = 0
                End If
            End If
            
        Case 7
            frmMain.txtOperador.text = "Imprimiendo Etiqueta"
            machine.PrintZebra
            StepNumber = 8
            DoEvents
            Sleep 3000
        Case 8
            frmMain.txtOperador.text = "Pegue etiqueta en el producto y Escanee el codigo de barras"
            If machine.comScanner.GetAvailableBytes >= machine.DMCNumberLength Then
                Dim result2 As Boolean
                
                result2 = machine.ReadDMC ' Read The scanner Data
                If result2 = True Then
                    '====================================
                    ' If InStr(1, machine.DMC, machine.Field17_DMC) >= 0 Then
                    '    StepNumber = 9
                    'Else
                    '    frmMain.txtOperador.text = "Error: Los DMC no corresponden"
                    '    Sleep 3000
                    '    StepNumber = 0
                    'End If
                    '====================================
                    Dim Index As Integer
                    Index = InStr(1, machine.DMC, machine.SerialNumber)
                    If Index >= 1 Then
                        StepNumber = 9
                    Else
                        frmMain.txtOperador.text = "Error: Los DMC no corresponden"
                        machine.BadParts = machine.BadParts + 1
                        UpdateGUI
                        DoEvents
                        Sleep 3000
                        StepNumber = 0
                    End If
                Else
                    frmMain.txtOperador.text = "Error: Al Leer DMC"
                    Sleep 3000
                    StepNumber = 0
                End If
                
            End If
        Case 9
            frmMain.txtOperador.text = "Envaindo PartProcessed a MES"
            SendPartProcessed
            StepNumber = 10
        Case 10
            frmMain.txtOperador.text = "Esperando Respuesta PartProcessed de MES"
            If machine.SocketAvailable Then
                If ReadPartProcessed = True Then
                    frmMain.txtOperador.text = "Pieza Processada Correctamente"
                    machine.GoodParts = machine.GoodParts + 1
                    UpdateGUI
                    DoEvents
                    Sleep 3000
                    
                    StepNumber = 0 ' Termina ciclo empieza e nuevo
                Else
                    frmMain.txtOperador.text = "Error: Los DMC no corresponden"
                    machine.BadParts = machine.BadParts + 1
                    UpdateGUI
                    DoEvents
                    Sleep 3000
                    StepNumber = 0
                End If
                
            End If
        
    End Select
End Function
