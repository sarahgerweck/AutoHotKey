#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode 1     ; Starts-with matching`

; This will track if we initiate an auto-run while `w` is already pressed.
w_pressed := false

#ifWinActive, Deus Ex
{
  `::
    if (GetKeyState("w", "P")) {
    ; w is already pressed. Set a variable so we know to keep running when
    ; it's released, but don't send any key activity at this point.
      w_pressed := true
    } else {
    ; We're not already running, so start it up!
    ; Unset w_pressed just to be safe.
    w_pressed := false
      Send {w down}
    }
    return
  w::
    ; Unset w_pressed just to be safe.
    w_pressed := false
    ; Always relay this keypress.
    Send {w down}
    return
  w up::
    if (w_pressed) {
    ; We started autorunning while already running, which means we want to
    ; suppress this key-up event.
      w_pressed := false
    } else {
    ; No suppression flag, relay the event normally.
      Send {w up}
    }
    return
}
