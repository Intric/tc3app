#IfWinActive, ahk_exe RobloxPlayerBeta.exe

active:=false
mx:=0
my:=0
chatting:=false
IniRead,mx,data.ini,m,x
IniRead,my,data.ini,m,y

F5::
active:=not active
if(active){
    ToolTip,APP Activated
}else{
    ToolTip,APP Disabled
}
SetTimer,RemoveToolTip,2000
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
    PixelGetColor,color,mx,my
    if(color=0xC1A179){
        Send, q
    }
    sleep,200
    CoordMode Pixel
    ImageSearch,FoundX,FoundY,0,0,A_ScreenWidth,A_ScreenHeight,*25 *TransBlack powerplanticon.PNG
    if(ErrorLevel=0){
        Click,up,right
        MouseGetPos,ox,oy
        BlockInput,MouseMove
        MouseClick,left,FoundX,FoundY,1,0
        MouseMove,ox,oy,0
        BlockInput,MouseMoveOff
        Send,q
    }
}
return
^z::
if(active and not chatting){
    MouseGetPos,mx,my
    SetTimer,RemoveToolTip,2000
    IniWrite,%mx%,data.ini,m,x
    IniWrite %my%,data.ini,m,y
    ToolTip, Cog position set
}
return

RemoveToolTip:
SetTimer,RemoveToolTip,Off
ToolTip
return
