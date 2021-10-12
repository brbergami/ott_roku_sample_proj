sub init()
    m.task = createObject("roSGNode", "ConfigTask")
    m.task.observeField("response", "launchWithConfig")
    m.task.control = "run"
    m.screenStack = {}
end sub

sub launchWithConfig(responseEvent as Object)
    m.task.unobserveField("response")
    m.task.control = "stop"
    appConfig = responseEvent.getData()
    for each screen in appConfig.screens
        screenObject = createObject("roSGNode", "AbstractScreen")
        screenObject.config = appConfig.screens[screen]
        if appConfig.screens[screen].showOnLaunch <> invalid
            m.top.appendChild(screenObject)
            m.landingScreen = screen
        end if
        m.screenStack[screen] = screenObject
    end for
end sub

' function onKeyEvent(key as String, press as Boolean) as Boolean
'
' end function


