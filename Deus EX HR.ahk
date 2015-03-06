#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode 1     ; Starts-with matching`

toggle := false

#ifWinActive, Deus Ex
{
  F1::
    if toggle := !toggle
     SetTimer, Send_w, 0
    else
     SetTimer, Send_w, off
    return

  Send_w:
    Send w
    return
}
