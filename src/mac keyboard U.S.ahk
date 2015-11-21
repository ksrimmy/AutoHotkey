;Autohotkey script to translate some Mac shortcuts for Windows
;Use Alt key instead of control key (Alt key is at the same place of Cmd on Mac)
;On Mac all hotkeys often used are: cmd+c, cmd+v, ... -> ctrl+c, ctrl+v, ... (on PC)
;Use ScrollLock key to temporary activate / descativate the current script, in case of get some trouble
;Added some Mac specific shortcuts like Alt+Shift+Right, Alt+Shift+Left or Cmd+Shift+L
;Work only with left Alt and left Control keys

#UseHook
#InstallKeybdHook

;Console - ctrl+v : past
;if WinActive("ahk_class ConsoleWindowClass")
;  ^v::SendInput {Raw}%clipboard% return
;
;Desktop or explorer - ctrl+n : new window
;if WinActive("ahk_class Progman") or WinActive("ahk_class ExploreWClass") or WinActive("ahk_class CabinetWClass")
;  ^N::Run explorer return

;Desktop or explorer - ctrl+shift+n : new folder
;if WinActive("ahk_class Progman") or WinActive("ahk_class ExploreWClass") or WinActive("ahk_class CabinetWClass")
;  !+n::Send !fwf; English: File > New > Folder
;  !+n::Send !fnd; French: Fichier > Nouveau > Dossier

LWin & a::Send {LCtrl Down}{a}{LCtrl Up}
LWin & b::Send {LCtrl Down}{b}{LCtrl Up}
LWin & c::Send {LCtrl Down}{c}{LCtrl Up}
LWin & d::Send {LCtrl Down}{d}{LCtrl Up}
LWin & e::Send {LCtrl Down}{e}{LCtrl Up}
LWin & f::Send {LCtrl Down}{f}{LCtrl Up}
LWin & g::Send {LCtrl Down}{g}{LCtrl Up}
LWin & h::Send {LCtrl Down}{h}{LCtrl Up}
LWin & i::Send {LCtrl Down}{i}{LCtrl Up}
LWin & j::Send {LCtrl Down}{j}{LCtrl Up}
LWin & k::Send {LCtrl Down}{k}{LCtrl Up}
;LWin & l::Send {LCtrl Down}{l}{LCtrl Up}


; Used to map LWin+l to Ctrl+l and when Shift is down, send "|" char instead
LWin & l::
GetKeyState, ShiftState, Shift, P
if ShiftState = D
{
  Send |
}
else
{
  Send {LCtrl Down}{l}{LCtrl Up}
}
return

LWin & m::Send {LCtrl Down}{m}{LCtrl Up}
;LWin & n::Send {LCtrl Down}{n}{LCtrl Up}

;If Desktop or Explorer active, Alt+Shift+n create a new folder and Alt+N open an new window
LWin & n::
GetKeyState, ShiftState, Shift, P
if (ShiftState == "D") and (WinActive("ahk_class Progman") or WinActive("ahk_class ExploreWClass") or WinActive("ahk_class CabinetWClass"))
  Send !fn{enter} ; Folder is in first so send enter directly else other type of document will be selected
else if (ShiftState == "U" and (WinActive("ahk_class Progman") or WinActive("ahk_class ExploreWClass") or WinActive("ahk_class CabinetWClass")))
  Run explorer
else
  Send {LCtrl Down}{n}{LCtrl Up}
return

LAlt & s::Send {ß}

LAlt & u::
  input, command, L1 ; L3 to limit the input to 2 keys
  GetKeyState, ShiftState, Shift, P
  if (ShiftState = "D") { 
    if (command = "a") {
      Send Ä
    } else if (command = "o") {
      Send Ö
    } else if (command = "u") {
      Send Ü
    } 
  } else {
    if (command = "a") {
      Send ä
    } else if (command = "o") {
      Send ö
    } else if (command = "u") {
      Send ü
    }
  }
return

LWin & o::Send {LCtrl Down}{o}{LCtrl Up}
LWin & p::Send {LCtrl Down}{p}{LCtrl Up}
LWin & q::Send {LCtrl Down}{q}{LCtrl Up}
LWin & r::Send {LCtrl Down}{r}{LCtrl Up}
LWin & s::Send {LCtrl Down}{s}{LCtrl Up}
LWin & t::Send {LCtrl Down}{t}{LCtrl Up} 
LWin & u::Send {LCtrl Down}{u}{LCtrl Up}
;LWin & v::Send {LCtrl Down}{v}{LCtrl Up}
LWin & v::
if WinActive("ahk_class ConsoleWindowClass")
  SendInput {Raw}%clipboard% return
else
  Send {LCtrl Down}{v}{LCtrl Up}
return
LWin & w::Send {LCtrl Down}{w}{LCtrl Up}
LWin & x::Send {LCtrl Down}{x}{LCtrl Up}
LWin & y::Send {LCtrl Down}{y}{LCtrl Up}
LWin & z::Send {LCtrl Down}{z}{LCtrl Up}

LCtrl & a::Send {LWin Down}{a}{LWin Up}
LCtrl & b::Send {LWin Down}{b}{LWin Up}
LCtrl & c::Send {LWin Down}{c}{LWin Up}
LCtrl & d::Send {LWin Down}{d}{LWin Up}
LCtrl & e::Send {LWin Down}{e}{LWin Up}
LCtrl & f::Send {LWin Down}{f}{LWin Up}
LCtrl & g::Send {LWin Down}{g}{LWin Up}
LCtrl & h::Send {LWin Down}{h}{LWin Up}
LCtrl & i::Send {LWin Down}{i}{LWin Up}
LCtrl & j::Send {LWin Down}{j}{LWin Up}
LCtrl & k::Send {LWin Down}{k}{LWin Up}
LCtrl & l::Send {LWin Down}{l}{LWin Up}
LCtrl & m::Send {LWin Down}{m}{LWin Up}
LCtrl & n::Send {LWin Down}{n}{LWin Up}
LCtrl & o::Send {LWin Down}{o}{LWin Up}
LCtrl & p::Send {LWin Down}{p}{LWin Up}
LCtrl & q::Send {LWin Down}{q}{LWin Up}
LCtrl & r::Send {LWin Down}{r}{LWin Up}
LCtrl & s::Send {LWin Down}{s}{LWin Up}
LCtrl & t::Send {LWin Down}{t}{LWin Up}
LCtrl & u::Send {LWin Down}{u}{LWin Up}
LCtrl & v::Send {LWin Down}{v}{LWin Up}
LCtrl & w::Send {LWin Down}{w}{LWin Up}
LCtrl & x::Send {LWin Down}{x}{LWin Up}
LCtrl & y::Send {LWin Down}{y}{LWin Up}
LCtrl & z::Send {LWin Down}{z}{LWin Up}



LWin & Up::Send {LCtrl Down}{Home}{LCtrl Up} ; often used to go at the top of current document
LWin & Down::Send {LCtrl Down}{End}{LCtrl Up} ; often used to go at the bottom of current document

<!<+Right::Send {LCtrl Down}{RShift Down}{Right}{RShift Up}{LCtrl Up} ; Cmd+Shift+Right -> Ctrl+Shift+Right often used for word selection
<!<+Left::Send {LCtrl Down}{RShift Down}{Left}{RShift Up}{LCtrl Up} ; Cmd+Shift+Left -> Ctrl+Shift+Left often used for word selection

<#<+Right::Send {LWin Down}{RShift Down}{End}{RShift Up}{LWin Up} ; Alt+Shift+Right -> Alt+Shift+End often used to move at the begin of current line
<#<+Left::Send {LWin Down}{RShift Down}{Home}{RShift Up}{LWin Up} ; Alt+Shift+Left -> Alt+Shift+Home often used to move at the end of current line



~ScrollLock::
; Wait for it to be released because otherwise the hook state gets reset
; while the key is down, which causes the up-event to get suppressed,
; which in turn prevents toggling of the ScrollLock state/light:
KeyWait, ScrollLock
GetKeyState, ScrollLockState, ScrollLock, T
If ScrollLockState = D
{
  Hotkey, LWin & a, On
  Hotkey, LWin & b, On
  Hotkey, LWin & c, On
  Hotkey, LWin & d, On
  Hotkey, LWin & e, On
  Hotkey, LWin & f, On
  Hotkey, LWin & g, On
  Hotkey, LWin & h, On
  Hotkey, LWin & i, On
  Hotkey, LWin & j, On
  Hotkey, LWin & k, On
  Hotkey, LWin & l, On
  Hotkey, LWin & m, On
  Hotkey, LWin & n, On
  Hotkey, LWin & o, On
  Hotkey, LWin & p, On
  Hotkey, LWin & q, On
  Hotkey, LWin & r, On
  Hotkey, LWin & s, On
  Hotkey, LWin & t, On
  Hotkey, LWin & u, On
  Hotkey, LWin & v, On
  Hotkey, LWin & w, On
  Hotkey, LWin & x, On
  Hotkey, LWin & y, On
  Hotkey, LWin & z, On

  Hotkey, LCtrl & a, On
  Hotkey, LCtrl & b, On
  Hotkey, LCtrl & c, On
  Hotkey, LCtrl & d, On
  Hotkey, LCtrl & e, On
  Hotkey, LCtrl & f, On
  Hotkey, LCtrl & g, On
  Hotkey, LCtrl & h, On
  Hotkey, LCtrl & i, On
  Hotkey, LCtrl & j, On
  Hotkey, LCtrl & k, On
  Hotkey, LCtrl & l, On
  Hotkey, LCtrl & m, On
  Hotkey, LCtrl & n, On
  Hotkey, LCtrl & o, On
  Hotkey, LCtrl & p, On
  Hotkey, LCtrl & q, On
  Hotkey, LCtrl & r, On
  Hotkey, LCtrl & s, On
  Hotkey, LCtrl & t, On
  Hotkey, LCtrl & u, On
  Hotkey, LCtrl & v, On
  Hotkey, LCtrl & w, On
  Hotkey, LCtrl & x, On
  Hotkey, LCtrl & y, On
  Hotkey, LCtrl & z, On

  Hotkey, LWin & Up, On
  Hotkey, LWin & Down, On

  Hotkey, <!<+Right, On
  Hotkey, <!<+Left, On

  Hotkey, <#<+Right, On
  Hotkey, <#<+Left, On
}
else
{
  Hotkey, LWin & a, Off
  Hotkey, LWin & b, Off
  Hotkey, LWin & c, Off
  Hotkey, LWin & d, Off
  Hotkey, LWin & e, Off
  Hotkey, LWin & f, Off
  Hotkey, LWin & g, Off
  Hotkey, LWin & h, Off
  Hotkey, LWin & i, Off
  Hotkey, LWin & j, Off
  Hotkey, LWin & k, Off
  Hotkey, LWin & l, Off
  Hotkey, LWin & m, Off
  Hotkey, LWin & n, Off
  Hotkey, LWin & o, Off
  Hotkey, LWin & p, Off
  Hotkey, LWin & q, Off
  Hotkey, LWin & r, Off
  Hotkey, LWin & s, Off
  Hotkey, LWin & t, Off
  Hotkey, LWin & u, Off
  Hotkey, LWin & v, Off
  Hotkey, LWin & w, Off
  Hotkey, LWin & x, Off
  Hotkey, LWin & y, Off
  Hotkey, LWin & z, Off

  Hotkey, LCtrl & a, Off
  Hotkey, LCtrl & b, Off
  Hotkey, LCtrl & c, Off
  Hotkey, LCtrl & d, Off
  Hotkey, LCtrl & e, Off
  Hotkey, LCtrl & f, Off
  Hotkey, LCtrl & g, Off
  Hotkey, LCtrl & h, Off
  Hotkey, LCtrl & i, Off
  Hotkey, LCtrl & j, Off
  Hotkey, LCtrl & k, Off
  Hotkey, LCtrl & l, Off
  Hotkey, LCtrl & m, Off
  Hotkey, LCtrl & n, Off
  Hotkey, LCtrl & o, Off
  Hotkey, LCtrl & p, Off
  Hotkey, LCtrl & q, Off	
  Hotkey, LCtrl & r, Off
  Hotkey, LCtrl & s, Off
  Hotkey, LCtrl & t, Off
  Hotkey, LCtrl & u, Off
  Hotkey, LCtrl & v, Off
  Hotkey, LCtrl & w, Off
  Hotkey, LCtrl & x, Off
  Hotkey, LCtrl & y, Off
  Hotkey, LCtrl & z, Off

  Hotkey, LWin & Up, Off
  Hotkey, LWin & Down, Off

  Hotkey, <!<+Right, Off
  Hotkey, <!<+Left, Off

  Hotkey, <#<+Right, Off
  Hotkey, <#<+Left, Off
}
return