#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode 3     ; Exact-match

; Standard way to do a click simulation. Useful for games.
SendClick() {
  Send {LButton down}
  Sleep 20
  Send {LButton up}
  return
}

#IfWinActive, Elder Scrolls Online
{
  NumpadEnter::
    Send {LAlt}
    Sleep 10
    SendClick()
    return

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

