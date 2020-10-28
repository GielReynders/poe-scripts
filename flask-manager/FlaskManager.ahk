#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

F4:: Suspend On         ;To stop the fuction of the script. (in case you need a "3" or "f"). This does not exit the script.
F3:: Suspend Off        ;To resume the function of the script.  
         

D::                     ;Hotkey for 3
{
    number3ButtonsToPress := ["3"]

    Loop % number3ButtonsToPress.Length()
    {
        button := number3ButtonsToPress[A_Index]
        Send, {%button%}
        RandomDelay()
    }
    Return
}


F::                     ;Hotkey for f
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


RandomDelay()
{
   Sleep, Random (20,50) 
}