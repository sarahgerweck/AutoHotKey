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
}

