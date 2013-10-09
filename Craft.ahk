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

SynthX := 817
SynthY := 610

HQ1X := 725
HQ1Y := 297

SendClick() {
  Send {LButton down}
  Sleep 50 + Rand(-20, 20)
  Send {LButton up}
}

ClickSynth() {
  global SynthX, SynthY
  MouseMove, %SynthX%, %SynthY%
  SendClick()
}

DoLoop(Keys, Hq1Count) {
  global Queued, Cooldown, ShortSleep, KeepRunning, HQ1X, HQ1Y

  while Queued > 0
  {
    Loop %Hq1Count% {
      MouseMove, %HQ1X%, %HQ1Y%
      SendClick()
      Sleep 275 + Rand(-20, 20)
    }
    ClickSynth()
    Sleep 3000 + Rand(-10, 50)
    Loop parse, Keys, `,
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
}

Hq1Count := 0

#IfWinActive, FINAL FANTASY
{
  ^NumpadEnter::
    KeepRunning := false
    Queued := 0
    return

  +NumpadEnter:: Queued++

  NumpadAdd::
    Hq1Count := 2
    return

  NumpadEnter::
    KeepRunning := true
    Queued++
    DoLoop(keys, Hq1Count)
    Hq1Count := 0
    return
}

