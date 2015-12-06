#NoEnv
#SingleInstance Force
#Warn All

#Include touch.ahk

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 3    ; Exact matches

{
  #z::
    Touch()
    Touch("c:\Utils\.curves")
    return
}
