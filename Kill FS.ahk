#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

ConfirmTimeout := 3

; Here is a list of active windows we might want to kill. Each of these
; sets a `IfWinActive` directive to match a process and then it binds one or
; more keys, usually Win+End to the kill command. The bindings don't have a
; `return`, so they all fall through into the main script at the bottom.
#IfWinActive ahk_class MediaPlayerClassicW
  #End::
#IfWinActive, Skyrim
  #End::

; The shared script: find the PID, pop a dialog, then kill that process
; after `ConfirmTimeout` seconds have elapsed unless *Cancel* was pressed.
WinGet ProcId, PID
WinGet ProcName, ProcessName
MsgBox 1, , Killing process %ProcName% (id: %ProcId%), %ConfirmTimeout%
IfMsgBox Cancel
  return
Process Close, %ProcId%
return
