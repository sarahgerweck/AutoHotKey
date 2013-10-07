#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

^+NumpadSub::
  MouseGetPos, x1, y1
  FileAppend, %x1%`t%y1%`r`n, C:\Users\Sarah\mouse-position.tsv
  Return
