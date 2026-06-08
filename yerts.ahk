

#NoEnv
#SingleInstance Force
#MaxThreadsPerHotkey, 2

if !A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

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
    Suspend, Toggle
	Pause, Toggle
Return
