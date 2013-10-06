#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode 1     ; Starts-with matching (FFXIV's window title is long and it has its
                        ; version number inside it.)

Cooldown := 3150
ShortSleep := 2100

keys = 5,9,4,8,9,8,9,8,7

KeepRunning := true
Queued := 0

#IfWinActive, FINAL FANTASY
{
  ^NumpadEnter:: 
    KeepRunning := false
    Queued := 0
    return

  +NumpadEnter:: Queued++

  NumpadEnter::
    KeepRunning := true
    Queued++
    while Queued > 0
    {
      Send {LButton down}
      Sleep 50
      Send {LButton up}
      Sleep 3000
      Loop parse, keys, `,
      {
        if not KeepRunning
        {
          KeepRunning := true
          break 
        }
        Send %A_LoopField%
        if A_LoopField = 8
          Sleep %Cooldown%
        else
          Sleep %ShortSleep%
      }
      if Queued > 0
      {
        Queued--
        Sleep 4500
      }
    }
	Return
}

