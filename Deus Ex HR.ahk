#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode 1     ; Starts-with matching`

toggle := false

#ifWinActive, Deus Ex
{
  `::
    if toggle := !toggle
      Send {w down}
    else
      Send {w up}
    return
}
