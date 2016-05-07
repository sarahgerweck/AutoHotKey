#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 3    ; Exact matches

#IfWinActive, Poly Bridge
{
  ; The way trackpads scroll is not compatible with some games.
  ; Use PgUp & PgDn as alternatives to the scroll wheel.
  PgUp::Send {WheelUp}
  PgDn::Send {WheelDown}
}
