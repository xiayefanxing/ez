#NoEnv ; For security
#SingleInstance force
;#NoTrayIcon
#InstallKeybdHook
#InstallMouseHook
#Hotstring EndChars -()[]{}:;'"/\,.?! `n   ;disable tab key to avoid conflicts with another software I am using--typing assistant
Process, Priority, , High
DetectHiddenText, off
SetTitleMatchMode 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;for reference ! Alt ^ Control + Shift # Windows
;for more check help->send
;http://www.autohotkey.com/docs/commands.htm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;modify keys' behaviors
;suspend when necessary using pausebreak on the keyboard
pause::suspend ;suspend hotkeys

mbutton::
run rundll32.exe shell32.dll`,Control_RunDLL main.cpl @0
winwait Mouse Properties ahk_class #32770
winactivate Mouse Properties ahk_class #32770
send {shift down}{tab}{shift up} {right 3}
sleep 100
send {tab}{up}
sleep 500
send {enter}
return

;disable shift+delete
+sc153::return
;open recycle bin
#sc153::Run ::{645ff040-5081-101b-9f08-00aa002f954e} 

;f5
#ifwinactive AutoHotkey.ahk
f5::
send ^s
sleep 100
reload
#ifwinnotactive
return

;switch applications
f3::send !{tab}

;replace tilde with backspace, so that I can easily press backspace with my left hand.
;not applicable to latex editors, including texwork, lyx, texmaker
#ifwinactive ahk_class QWidget
sc029::sc029
#ifwinnotactive
sc029::sc00E
return
!sc029::send {~}

;replace capslock with enter, so that I can easily press enter with my left hand.
Capslock::sc01C

;move carets to the up, down, left and right--ideas from emacs and joystick games.
!i::send {up}
!k::send {down}
!j::send {left}
!l::send {right} 
!u::send {home}
!o::send {end}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;global hotkeys

;paste plain texts
#v::
Clip0 = %ClipBoardAll% 
Transform UC, Unicode         ; Save Unicode text 
Transform Clipboard, Unicode, %UC% 
Send ^v                       ; For best compatibility: SendPlay 
Sleep 500                     ; Don't change clipboard while it is pasted! (Sleep > 0) 
ClipBoard = %Clip0%           ; Restore original ClipBoard 
VarSetCapacity(Clip0, 0)      ; Free memory 
Return

^!a:: Winset, Alwaysontop, , A

#q::send !{F4}
#w::send !{F4}

#e::run "C:\Program Files (x86)\zabkat\xplorer2_lite\xplorer2_lite.exe"

f1::winactivate MATLAB

; teamviewer
#c::^c
#a::^a
#s::^s
#z::^z
#x::^x
#v::^v
#y::^y
#f::^f
#n::^n
#b::^b
#o::^o
#i::^i
#p::^p
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;backup for reference

;#ifwinactive TeXworks ahk_class QWidget
;f5::^t
;#ifwinactive ahk_class Rgui Workspace
;f5::^r
;#ifwinactive AutoMate.ahk - Notepad++ ahk_class Notepad++
;f5::
;send ^s
;sleep 100
;reload
;#ifwinnotactive
;return

;f1::
;sendplay {sc153}
;ifwinexist Confirm deletion ahk_class #32770
;{
;winactivate Confirm deletion ahk_class #32770
;winwaitactive Confirm deletion ahk_class #32770
;sendplay {tab 5}
;}
;return

;swap mouse press/hold left then right
~lbutton & rbutton:: run "C:\Users\labguest\Desktop\JDN5\ez\AutoHotkey104805\AutoHotkey.chm",,max
~rbutton & lbutton:: run "C:\Users\labguest\Desktop\JDN5\ez\AutoHotkey104805\license.txt",,max