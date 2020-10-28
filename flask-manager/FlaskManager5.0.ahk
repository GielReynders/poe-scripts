#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

F3:: Suspend Off        ;To resume the function of the script. 
F4:: Suspend On         ;To suspend the fuction of the script. (in case you need a "3" or "f"). This does not exit the script.

3::                     ;Hotkey for 3
If WinActive("Path of Exile")
{
    number3ButtonsToPress := ["b", "o"]

    Loop % number3ButtonsToPress.Length()
    {
        button := number3ButtonsToPress[A_Index]
        Send, {%button%}
        RandomDelay()
    }
    Return
}
Else
{
    Send, {text}3                   ;{text} so that the 3 is interpreted as literal text, otherwise the scrips loops infinitely
    Return
}


F::                     ;Hotkey for f
If WinActive("Path of Exile")
{
    letterfButtonsToPress := ["1", "2", "4", "5"]

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
