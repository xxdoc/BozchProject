VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmMain 
   BackColor       =   &H00C0C0C0&
   Caption         =   "BOSCH Project"
   ClientHeight    =   7185
   ClientLeft      =   330
   ClientTop       =   450
   ClientWidth     =   11925
   LinkTopic       =   "Form1"
   ScaleHeight     =   7185
   ScaleWidth      =   11925
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer tmrUpdateStateMachine 
      Interval        =   150
      Left            =   600
      Top             =   120
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Mensajes del Sistema"
      Height          =   1815
      Left            =   6120
      TabIndex        =   16
      Top             =   5280
      Width           =   5655
      Begin VB.Label lblAMS 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ESTACION SIN CONEXION                     MES"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   735
         Left            =   840
         TabIndex        =   17
         Top             =   360
         Visible         =   0   'False
         Width           =   3975
      End
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Opciones"
      Height          =   1815
      Left            =   120
      TabIndex        =   10
      Top             =   5280
      Width           =   5775
      Begin VB.CommandButton cmdexit 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Salir"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Left            =   4080
         Picture         =   "frmMain.frx":0000
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton btnUtils 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Utilerias"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Left            =   360
         Picture         =   "frmMain.frx":08A8
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton btnChangeModel 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Cambio Modelo"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Left            =   2160
         Picture         =   "frmMain.frx":13F3
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.TextBox txtOperador 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3495
      Left            =   6120
      MultiLine       =   -1  'True
      TabIndex        =   9
      Top             =   1680
      Width           =   5655
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00C0C0C0&
      Height          =   3615
      Left            =   120
      TabIndex        =   1
      Top             =   1560
      Width           =   5775
      Begin VB.TextBox txtModel 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
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
         Height          =   420
         Left            =   2400
         Locked          =   -1  'True
         TabIndex        =   18
         TabStop         =   0   'False
         ToolTipText     =   "Numero de Seria de la parte, este es escaneado por el escaner manual"
         Top             =   1080
         Width           =   3135
      End
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
         Left            =   2400
         Locked          =   -1  'True
         MaxLength       =   4
         TabIndex        =   15
         Text            =   "0000"
         Top             =   1680
         Width           =   3135
      End
      Begin VB.TextBox txtcounter 
         Alignment       =   2  'Center
         BackColor       =   &H0080FF80&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   465
         Left            =   2400
         Locked          =   -1  'True
         TabIndex        =   4
         TabStop         =   0   'False
         Text            =   "0"
         Top             =   2280
         Width           =   3135
      End
      Begin VB.TextBox txtSN 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
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
         Height          =   420
         Left            =   2400
         Locked          =   -1  'True
         TabIndex        =   3
         TabStop         =   0   'False
         ToolTipText     =   "Numero de Seria de la parte, este es escaneado por el escaner manual"
         Top             =   480
         Width           =   3135
      End
      Begin VB.TextBox txtbadunits 
         Alignment       =   2  'Center
         BackColor       =   &H008080FF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   480
         Left            =   2400
         Locked          =   -1  'True
         TabIndex        =   2
         Text            =   "0"
         Top             =   2880
         Width           =   3135
      End
      Begin VB.Label lblTypeVar 
         BackColor       =   &H00C0C0C0&
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
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   120
         TabIndex        =   14
         Top             =   1800
         Width           =   2055
      End
      Begin VB.Label Label1 
         BackColor       =   &H00C0C0C0&
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
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   1200
         Width           =   2175
      End
      Begin VB.Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Unidades Buenas"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   2400
         Width           =   2175
      End
      Begin VB.Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Numero Serial "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   600
         Width           =   1815
      End
      Begin VB.Label Label7 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Unidades Malas"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   3000
         Width           =   1935
      End
   End
   Begin VB.PictureBox picBosch 
      Height          =   1455
      Left            =   2880
      Picture         =   "frmMain.frx":1CB6
      ScaleHeight     =   1395
      ScaleWidth      =   5715
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   0
      Width           =   5775
   End
   Begin MSWinsockLib.Winsock sockMES 
      Left            =   120
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemoteHost      =   "127.0.0.1"
      RemotePort      =   3550
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'========================================
' Force explicit variable declaration.
'========================================
Option Explicit

'==========================
'Controls Events
'==========================
Private Sub Form_Initialize()
    InitializeProgram
    OpenPorts
    StartStateMachine
End Sub

'====================================================
' This is is to get a responsibe desing of the form
'====================================================
Private Sub Form_Resize()
    
    If Me.Width < 10000 Then Me.Width = 10000
    'If Me.height < 10000 Then Me.height = 7000
    
    picBosch.Left = (Me.Width / 2) - (picBosch.Width) / 2
    Frame1.Left = (Me.Width / 2) - (Frame1.Width) - 100
    txtOperador.Left = (Me.Width / 2) + 100
    Frame2.Left = (Me.Width / 2) - (Frame2.Width) - 100
    Frame3.Left = (Me.Width / 2) + 100
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Cancel = 1 ' Prevents un load the form.
End Sub

'====================================================
' Opens the change model Form
'====================================================
Private Sub btnChangeModel_Click()
    If machine.SocketConnected = True Then
        frmChangeModel.Show
    Else
        MsgBox "No se puede hacer cambio de Modelo. Por favor Verifique Conexion a MES", vbCritical _
            + vbOKOnly, "Error Conexion a Systema MES"
    End If
End Sub

'====================================================
' Openes the Utilities Form
'====================================================
Private Sub btnUtils_Click()
    frmUtilities.Show
End Sub

'====================================================
' End the application
'====================================================
Private Sub cmdexit_Click()
    End
End Sub

Private Sub tmrUpdateStateMachine_Timer()
    UpdateStateMachine
End Sub

'==========================
'Local Defined Functions.
'==========================
Public Sub OpenPorts()
    'Load Win Socket Configuration of config files
    ConfigureSocket sockMES, "config\MESSocket.ini"
    
    'Open Win Socket Configuration of config files
    sockMES.Connect
    
    Dim attempts As Integer
    Do Until sockMES.State = sckConnected
        DoEvents
        Sleep 100
        
        attempts = attempts + 1
        If attempts > 20 Then   ' wait 2 seconds
             MsgBox "Error No se Pudo encontrar sistema MES: " & sockMES.RemoteHost & _
             " Port: " & Str(sockMES.RemotePort), vbCritical _
                + vbOKOnly, "Error connexion Sistema MES"
                
             machine.SocketConnected = False
             Exit Sub
        End If
    Loop
    
    machine.SocketConnected = True
End Sub

'==========================
' Socket Interaction Events
'==========================
Private Sub sockMES_DataArrival(ByVal bytesTotal As Long)
On Error GoTo Error
    Dim data As String
    sockMES.GetData data, vbString
    
    machine.SocketData = data
    machine.SocketAvailable = True
    Exit Sub
Error:
    
End Sub

Private Sub sockMES_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    machine.SocketConnected = False
    StopStateMachine
    StartStateMachine
End Sub


