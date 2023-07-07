#NoEnv
#persistent
#MaxThreadsPerHotkey 2
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
CoordMode, Pixel, Screen
SoundBeep, 300, 200
SoundBeep, 400, 200
               
;             ____        _                __
;            / __ \____ _(_)   _____  ____/ /
;           / / / / __ `/ / | / / _ \/ __  / 
;          / /_/ / /_/ / /| |/ /  __/ /_/ /  
;         /_____/\__,_/_/ |___/\___/\__,_/   
key_stay_on := "Up"
key_hold_mode := "F2"
key_hold_mode2 := "F3" 
key_fastclick := "Ins"
key_off := "Down"
key_gui_hide := "Home"
key_exit := "End"
key_hold := "RButton"
 

pixel_box := 2
pixel_sens := 58
pixel_color := 0xFFFF00
tap_time := 120
tap_time2 := 5 
 

Gui,2:Font,Cdefault,Fixedsys
Gui,2:Color,Black
Gui,2:Color, EEAA99
Gui,2:Add,Progress, x10 y20 w100 h23 Disabled BackgroundGreen vC3
Gui,2:Add,Text, xp yp wp hp cYellow BackgroundTrans Center 0x200 vB3 gStart,ON
Gui,2:Add,Progress, x10 y20 w100 h23 Disabled BackgroundGreen vC2
Gui,2:Add,Text, xp yp wp hp cYellow BackgroundTrans Center 0x200 vB2 gStart,HOLD MODE
Gui,2:Add,Progress, x10 y20 w100 h23 Disabled BackgroundGreen vC4 
Gui,2:Add,Text, xp yp wp hp cYellow BackgroundTrans Center 0x200 vB4 gStart,HOLD MODE 2 
Gui,2:Add,Progress, xp yp wp hp Disabled BackgroundRED vC1
Gui,2:Add,Text, xp yp wp hp cYellow BackgroundTrans Center 0x200 vB1 gStart,OFF
Gui,2: Show, x10 y1 w200 h80 ; Increased height for the new elements
Gui 2:+LastFound +ToolWindow +AlwaysOnTop -Caption
WinSet, TransColor, EEAA99
 
2Guiescape:
2Guiclose:
leftbound:= A_ScreenWidth/2-pixel_box
rightbound:= A_ScreenWidth/2+pixel_box
topbound:= A_ScreenHeight/3-pixel_box
bottombound:= A_ScreenHeight/2+pixel_box
hotkey, %key_stay_on%, stayon
hotkey, %key_hold_mode%, holdmode
hotkey, %key_hold_mode2%, holdmode2 
hotkey, %key_off%, offloop
hotkey, %key_gui_hide%, guihide
hotkey, %key_exit%, terminate
Hotkey, %key_fastclick%, fastclick
return
 
start:
gui,2:submit,nohide
terminate:
SoundBeep, 3000, 2000
SoundBeep, 2000, 2000
Sleep 400
exitapp
stayon:
SoundBeep, 3000, 2000
settimer, loop2, off
settimer, loop1, 100
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B4 
GuiControl,2: hide,C4
GuiControl,2: show,B3
GuiControl,2: show,C3
return
 
holdmode:
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, 100
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: show,B2
GuiControl,2: show,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
GuiControl,2: hide,B4 
GuiControl,2: hide,C4
return
 
holdmode2:
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, 100
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: show,B4 
GuiControl,2: show,C4
GuiControl,2: hide,B3
GuiControl,2: hide,C3
return
 
offloop:
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, off
GuiControl,2: show,B1
GuiControl,2: show,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
GuiControl,2: hide,B4 
GuiControl,2: hide,C4
return
 
guihide:
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
GuiControl,2: hide,B4 
GuiControl,2: hide,C4
return
 
loop1:
PixelSearch()
return
 
loop2:
While GetKeyState(key_hold, "P"){
    PixelSearch()
}
return
 
fastclick:
SoundBeep, 300, 200
toggle := !toggle
return
 
#if toggle
*~$LButton::
sleep 05
While GetKeyState("LButton", "P"){
    Click
    sleep %tap_time%
}
return
#if
 
#if toggle
*~$RButton:: 
sleep 05
While GetKeyState("RButton", "P"){
    Click
    sleep %tap_time2% 
}
return
#if
 
PixelSearch() {
global
PixelSearch, FoundX, FoundY, leftbound, topbound, rightbound, bottombound, pixel_color, pixel_sens, Fast RGB
If !(ErrorLevel)
{
    If !GetKeyState("LButton")
    {
        click
        sleep %tap_time%
    }
}
return
}
