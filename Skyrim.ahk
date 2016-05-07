#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 3    ; Exact matches

#IfWinActive, Skyrim
{
  ; The way trackpads scroll is not compatible with some games.
  ; Use PgUp & PgDn as alternatives to the scroll wheel.
  PgUp::Send {WheelUp}
  PgDn::Send {WheelDown}

  ; Synaptics interprets simultaneous left and right clicks as a middle click, and there's no way
  ; to disable this. So, we need to override the behavior.
  MButton::
    Send {LButton down}
    Send {RButton down}
  return

  MButton Up::
    Send {LButton up}
    Send {RButton up}
  return
}
