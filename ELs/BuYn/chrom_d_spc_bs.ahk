; SetTitleMatchMode, 2
#NoEnv  
#SingleInstance, Force
;#Persistent
SetTitleMatchMode, RegEx

IfWinExist, ahk_class Chrome_WidgetWin_1 
	{
	; WinGetActiveTitle, Title
	WinGetClass, Title, A
	ControlFocus, Chrome_RenderWidgetHostHWND2
	ControlSend,,{space}{backspace}{space}{backspace}, AI Dungeon - Google Chrome 
	WinActivate,ahk_class %Title%
	; ControlFocus, %Title%
	; MsgBox, %Title%
	; ControlSend,,spc bs, ahk_class Chrome_WidgetWin_1  
	}
else
	MsgBox, windows not found
