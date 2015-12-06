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
    ;runwait,%comspec% /c "c:/Utils/Argyll/bin/dispwin.exe -c"
    ;runwait,%comspec% /c "c:/Utils/Argyll/bin/dispwin.exe -L"
    ;runwait,"c:/Utils/Argyll/bin/dispwin.exe -c"
    ;runwait,"c:/Utils/Argyll/bin/dispwin.exe -L"
    return
}
