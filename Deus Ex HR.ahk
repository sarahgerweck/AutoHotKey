#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode 1     ; Starts-with matching`

#ifWinActive, Deus Ex
{
  `::
    Send {w down}
    return
}
