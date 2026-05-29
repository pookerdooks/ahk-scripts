;F11 = Hold Left Click  
;Numpad 8 = Hold 'R'
;Numpad 9 = Random Double-Click Spam
;Pause/Break = Toggle Script On/Off   tray icon will go from green(running) to red(paused)


#MaxThreadsPerHotkey, 2
LeftClickHold := 0
DoubleClickSpam := 0
RHold := 0


F11::
LeftClickHold := !LeftClickHold
If (LeftClickHold)
{
   Click, Down
} 
else 
{
   Click, Up
}

Return

Numpad8::
    RHold := !RHold
    If (RHold) 
{
        Send, {R Down}  
} 
else 
{
        Send, {R Up}    
}
Return




Numpad9::
    DoubleClickSpam := !DoubleClickSpam
    If (DoubleClickSpam) 
   {
        SetTimer, SpamRandomDouble, 50
    } 
    Else 
    {
        ShouldStop := true
        SetTimer, SpamRandomDouble, Off
    }
Return

SpamRandomDouble:
    If (ShouldStop) 
    {
        ShouldStop := false
        Return
    }
    Click
    Random, GapTime, 60, 80
    Sleep, %GapTime%
    If (ShouldStop) 
    {
        ShouldStop := false
        Return
    }
    Click
    Random, NextDelay, 150, 200
    If (!ShouldStop) 
    {
        SetTimer, SpamRandomDouble, %NextDelay%
    }
Return

Pause::
    Pause, Toggle
    TrayTip, Script Paused, Press Pause again to resume.
Return