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
LWin & g::Send {LCtrl Down}{g}{LCtrl Up}
LWin & h::Send {LCtrl Down}{h}{LCtrl Up}
LWin & i::Send {LCtrl Down}{i}{LCtrl Up}
LWin & j::Send {LCtrl Down}{j}{LCtrl Up}
LWin & k::Send {LCtrl Down}{k}{LCtrl Up}

;LWin & f::Send {LCtrl Down}{f}{LCtrl Up}
LWin & f::
GetKeyState, ShiftState, Shift, P
if (ShiftState == "D")
  Send {LCtrl Down}+{f}{LCtrl Up}
else 
  Send {LCtrl Down}{f}{LCtrl Up}
return


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

;If Desktop or Explorer active, Alt+Shift+n create a new folder and Alt+N open an new window
LWin & n::
GetKeyState, ShiftState, Shift, P
if (ShiftState == "D") and (WinActive("ahk_class Progman") or WinActive("ahk_class ExploreWClass") or WinActive("ahk_class CabinetWClass"))
  Send !fn{enter} ; Folder is in first so send enter directly else other type of document will be selected
else if (ShiftState == "U" and (WinActive("ahk_class Progman") or WinActive("ahk_class ExploreWClass") or WinActive("ahk_class CabinetWClass")))
  Run explorer
else if (ShiftState == "D")
  Send {LCtrl Down}+{n}{LCtrl Up}
else 
  Send {LCtrl Down}{n}{LCtrl Up}
return

LAlt & s::Send {a}

LAlt & u::
  input, command, L1 ; L3 to limit the input to 2 keys
  GetKeyState, ShiftState, Shift, P
  if (ShiftState = "D") { 
    if (command = "ak_class Progman") or {
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
;LWin & u::Send {LCtrl Down}{u}{LCtrl Up}
;LWin & v::Send {LCtrl Down}{v}{LCtrl Up}
LWin & v::
  if (WinActive("ahk_class ConsoleWindowClass")) {
    SendInput {Raw}%clipboard% 
  } else {  
    GetKeyState, ShiftState, Shift, P
    if (ShiftState == "D") {
      Send {LCtrl Down}+{v}{LCtrl Up}
    } else {
      Send {LCtrl Down}{v}{LCtrl Up}
    }
  }
return

LWin & w::Send {LCtrl Down}{w}{LCtrl Up}
LWin & x::Send {LCtrl Down}{x}{LCtrl Up}
LWin & y::
  GetKeyState, ShiftState, Shift, P
  if (ShiftState == "D") {
    Send {LCtrl Down}+{y}{LCtrl Up}
  } else {
    Send {LCtrl Down}{y}{LCtrl Up}
  }
return

LWin & z::Send {LCtrl Down}{z}{LCtrl Up}
; Explorer -> delete file
LWin & BS::Send {Del}

; OSX NAVIGATION AND SELECTION WITH CMD
#Up::Send {ctrl down}{Home}{ctrl up}
#Down::Send {ctrl down}{End}{ctrl up}
#+Up::Send {ctrl down}{shift down}{Home}{shift up}{ctrl up}
#+Down::Send {ctrl down}{shift down}{End}{shift up}{ctrl up}
#Left::Send {Home}
#Right::Send {End}
#+Left::Send {shift down}{Home}{shift up}
#+Right::Send {shift down}{End}{shift up}


; OSX NAVIGATION AND SELECTION WITH ALT
!Left::Send {ctrl down}{Left}{ctrl up}
!Right::Send {ctrl down}{Right}{ctrl up}
!+Left::Send {ctrl down}{shift down}{Left}{shift up}{ctrl up}
!+Right::Send {ctrl down}{shift down}{Right}{shift up}{ctrl up}


; DISABLES UNMODIFIED WIN-KEY IN FAVOR OF OSX SPOTLIGHT-LIKE BEHAVIOR
LWin::return
RWin::return
#Space::LWin


; REPLACES ALT-TAB APPLICATION SWITCHING WITH OSX CMD-TAB
LWin & Tab::AltTab
!Tab::return
