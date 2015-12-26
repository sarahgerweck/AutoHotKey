#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force

; Just a list of active windows we might want to kill.
#IfWinActive ahk_class MediaPlayerClassicW
#End::
#IfWinActive, Skyrim
#End:: 

; Actual script body that does the killing
WinGet ProcId, PID
WinGet ProcName, ProcessName
; Give up to five seconds to press cancel
MsgBox 1, , Killing process %ProcName% (id: %ProcId%), 3
IfMsgBox Cancel
  return
Process Close, %ProcId%
return
