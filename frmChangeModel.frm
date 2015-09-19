VERSION 5.00
Begin VB.Form frmChangeModel 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cambio de Modelo"
   ClientHeight    =   4515
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5640
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4515
   ScaleWidth      =   5640
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtTypeVar 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1200
      MaxLength       =   4
      TabIndex        =   3
      Text            =   "0000"
      Top             =   1920
      Width           =   3135
   End
   Begin VB.CommandButton btnChangeModel 
      Caption         =   "Solicitar Cambio de Modelo"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   1320
      TabIndex        =   2
      Top             =   3000
      Width           =   3135
   End
   Begin VB.ComboBox cboxParts 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   720
      TabIndex        =   0
      Top             =   720
      Width           =   4335
   End
   Begin VB.Label lblTypeVar 
      Caption         =   "Type Number"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   2040
      TabIndex        =   4
      Top             =   1440
      Width           =   1695
   End
   Begin VB.Label Label1 
      Caption         =   "Modelo"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   2400
      TabIndex        =   1
      Top             =   240
      Width           =   855
   End
End
Attribute VB_Name = "frmChangeModel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnChangeModel_Click()
    
    SendPLCChangeOver cboxParts.List(cboxParts.ListIndex), txtTypeVar.text
    
    Dim attempts As Integer
    
    Do Until machine.SocketAvailable = True
        attempts = attempts = 1
        DoEvents
        Sleep 100
        If attempts = 10 Then
            MsgBox "Error Recibir respuesta de sistema MES ", vbCritical _
            + vbOKOnly, "Error Cambio de Modelo"
            Exit Sub
        End If
    Loop

    If ReadPLCChangeOver = True Then
        machine.TypeNumber = cboxParts.List(cboxParts.ListIndex)
        machine.typevar = txtTypeVar.text
        MsgBox "MES Acepto el Cambio de Modelo", vbInfo _
            + vbOKOnly, "Cambio de Modelo"
        
        Unload Me
    Else
        MsgBox "MES Rechazo el Cambio de Modelo", vbCritical _
            + vbOKOnly, "Error Cambio de Modelo"
    End If
    
    
End Sub

Private Sub Form_Load()
    StopStateMachine
    cboxParts.Clear
    LoadPartNumbers cboxParts
    cboxParts.ListIndex = 0
End Sub

Private Sub Form_Unload(Cancel As Integer)
    StartStateMachine
End Sub
