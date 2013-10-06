#NoEnv
#SingleInstance Force

SendMode Input
SetTitleMatchMode, 3

#IfWinActive, Don't Starve
{
  PgUp::Send {WheelUp}
  PgDn::Send {WheelDown}
}
