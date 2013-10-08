#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode 1     ; Starts-with matching (FFXIV's window title is long and it has its
                        ; version number inside it.)

#IfWinActive, FINAL FANTASY
{
  LWin:: Return
  RWin:: Return
}
