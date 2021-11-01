#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
checkIfTradeMessage:="I'd like to buy your"
Previousclipboard:=0
smartMovementflasks:=True ;set this to true if you would like to use 2 movement speed flasks, in the second and third slot. The script will use a flask that's not empty whenever the hotkey is pressed.

F3:: Suspend Off        ;To resume the function of the script. 
F4:: Suspend On         ;To suspend the fuction of the script. (in case you need a "3" or "f"). This does not exit the script.

3::                     ;Hotkey for 3
If (WinActive("Path of Exile")) {
    If (smartMovementflasks = true) {
        PixelGetColor, color, 569, 1398
        If (color=0x0F0F0F) { ; flask in third slot is empty
            Send, 2           ; so we activate the flask in the second slot
            Return
        }
        Else {
            Send, b
            Return
        }
    }
    Else {
        number3ButtonsToPress := ["b"]
        Loop % number3ButtonsToPress.Length()
        {
            button := number3ButtonsToPress[A_Index]
            Send, {%button%}
            RandomDelay()
        }
        Return
    }
}
Else {
            Send, {text}3                   ;{text} so that the 3 is interpreted as literal text, otherwise the scrips loops infinitely
            Return
        }

F::                     ;Hotkey for f
If WinActive("Path of Exile")
{
    letterfButtonsToPress := ["1", "4", "5"]

    Loop % letterfButtonsToPress.Length()
    {
        button := letterfButtonsToPress[A_Index]
        Send, {%button%}
        RandomDelay()
    }
    Return
}
Else
{
    Send, {text}f
    Return
}

~^c::             ;Hotkey for control-c
{
    beforeCopyMessage:=Previousclipboard
    afterCopyMessage:=Clipboard
    If !(checkIfTradeMessage in afterCopyMessage)
    {
        Return
    }
    If !(beforeCopyMessage=afterCopyMessage)
    {
        WinActivate, Path of Exile
        Sleep, 50
        Send {Enter}
        Sleep, 25
        Send, {CtrlDown}a{CtrlUp}{BackSpace}
        Sleep, 25
        Send {CtrlDown}v{CtrlUp}
        Sleep, 25
        Send {Enter}
    }
    Previousclipboard:=afterCopyMessage
    Return
}

Sc029::             ;Hotkey for ~ (tilde)
                ;when the hotkeys are toggled, pressing ~ will open the inventory, move to mousepos 2500, 1030 (which is the second to last
                ;slot in the inventory), and press the right mouse button.
                ;put a portal scroll there, ~ now opens up a portal


If WinActive("Path of Exile")
{
    MouseGetPos, mouseposx, mouseposy
    Send {XButton2} ;XButton2 is the mouse 5 key (forward/next page), which we are using as a shortcut for opening the inventory within PoE
    RandomDelay()
    MouseMove, 2500, 1100, 5
    RandomDelay()
    Sleep, 100
    MouseClick Right
    RandomDelay()
    Sleep, 100
    MouseMove, mouseposx, mouseposy, 5
    RandomDelay()
    Send {XButton2}
    Return
}
























RandomDelay()
{
   Sleep, Random (20,50) 
   Return
}