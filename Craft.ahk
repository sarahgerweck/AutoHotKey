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

Rand( a=0.0, b=1 ) {
  IfEqual,a,,Random,,% r := b = 1 ? Rand(0,0xFFFFFFFF) : b
  Else Random,r,a,b
  Return r
}


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
      Sleep 50 + Rand(-10, 10)
      Send {LButton up}
      Sleep 3000 + Rand(-10, 50)
      Loop parse, keys, `,
      {
        if not KeepRunning
        {
          KeepRunning := true
          break 
        }
        Send %A_LoopField%
        if A_LoopField = 8
          Sleep Cooldown + Rand(0,30)
        else
          Sleep ShortSleep + Rand(-10,15)
      }
      if Queued > 0
      {
        Queued--
        Sleep 4500 + Rand(-100, 100)
      }
    }
	Return
}

