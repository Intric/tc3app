#IfWinActive, ahk_exe RobloxPlayerBeta.exe

active:=false
mx:=0
my:=0
isopen:=false
chatting:=false
IniRead,mx,data.ini,m,x
IniRead,my,data.ini,m,y

F5::
isopen:=false
active:=not active
if(active){
    ToolTip, APP Activated
}else{
    ToolTip, APP Disabled
}
SetTimer,RemoveToolTip,2000
return
RemoveToolTip:
SetTimer,RemoveToolTip,Off
ToolTip
return

~q::
if(active and not chatting){
    isopen:=true
}
return
~e::
if(active and not chatting){
    isopen:=false
}
return
~/::
if(active){
    chatting:=true
}
return
~Enter::
if(active){
    chatting:=false
}
return
~LButton::
if(active){
    chatting:=false
}
return

~z::
if(active and not chatting){
    if(not isopen){
        Send, q
    }
    MouseGetPos,ox,oy
    BlockInput, MouseMove
    MouseMove,mx,my
    Send, {Click}
    Send, q
    MouseMove,ox,oy
    BlockInput, MouseMoveOff
    isopen:=false
}
return
^z::
if(active and not chatting){
    MouseGetPos,mx,my
    IniWrite,%mx%,data.ini,m,x
    IniWrite %my%,data.ini,m,y
}
return
