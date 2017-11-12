#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 3    ; Exact matches

#IfWinActive, Offworld Trading Company
{
  LWin:: return
  RAlt::
    Send {MButton down}
    return
  RAlt Up::
    Send {MButton up}
    return
}

