#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

; Note: it's not entirely clear that SetTitleMatchMode works with the group-based mechanism.

SetTitleMatchMode 1     ; Starts-with matching (FFXIV's window title is long and it has its
                        ; version number inside it.)

; The list of windows where we don't want the Windows key to do anything.
GroupAdd, NoWinKey, The Stanley Parable
GroupAdd, NoWinKey, FINAL FANTASY
GroupAdd, NoWinKey, Elder Scrolls Online

; The actual hotkey definition: disable both Windows keys for our window group. (Most keyboards
; only have one, on the left, but we might as well handle both cases.)
#IfWinActive ahk_group NoWinKey
{
  LWin:: Return
  RWin:: Return
}
