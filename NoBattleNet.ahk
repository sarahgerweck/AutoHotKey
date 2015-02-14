#NoEnv
#SingleInstance Force
#Warn All

toggle := false

^+z::
  if (toggle) {
    run, netsh advfirewall firewall set rule name="NoBattle" new enable=no
  } else {
    run, netsh advfirewall firewall set rule name="NoBattle" new enable=yes
  }
  toggle := !toggle
return

