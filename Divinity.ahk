#NoEnv
#SingleInstance Force
#Warn All

SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 2    ; Contains matching
;SetKeyDelay, 0, 40

#IfWinActive, DX9
{
  LWin:: Return
  RWin:: Return

  ^PgUp::
    Loop, 12
    {
      Send {PgUp down}
      Sleep 5
      Send {PgUp up}
      Sleep 8
    }
    return
  ^PgDn::
    Loop, 12
    {
      Send {PgDn down}
      Sleep 5
      Send {PgDn up}
      Sleep 8
    }
    return
}
