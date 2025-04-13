#NoEnv
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; === НАСТРОЙКИ ===
amplitude := 1000    ; Ширина зигзага (пикселей)
stepDown := 3        ; Шаг вниз (пикселей)
moveSpeed := 20       ; Скорость движения (1-20, где 1 - медленно, 20 - быстро)
sleepTime := 1       ; Задержка между шагами (мс)
isRunning := false
stopFlag := false
F3::
    if (isRunning) {
        return  
    }
    isRunning := true
    stopFlag := false
    Send, {RButton down}  
    MouseGetPos, startX, startY
    x := startX
    y := startY
    speedParam := 21 - moveSpeed
    Loop {
        if (stopFlag) {
            break
        }
        x += amplitude
        y += stepDown
        MouseMove, x, y, speedParam
        Sleep, sleepTime
		
        x -= amplitude
        y += stepDown
        MouseMove, x, y, speedParam
        Sleep, sleepTime
    }
    Send, {RButton up}
    isRunning := false
return
F4::
    stopFlag := true
    isRunning := false
    Send, {RButton up}
return