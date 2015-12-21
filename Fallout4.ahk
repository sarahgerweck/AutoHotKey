#NoEnv
#SingleInstance Force
#Warn All

#Include touch.ahk

SendMode Input
SetWorkingDir %A_ScriptDir%


{
  ; Initialize the `Touch` data structures
  Touch()
}

;SetTitleMatchMode, 3    ; Exact matches

{
  #z::
    Touch("c:\Utils\.curves")
    return
}
