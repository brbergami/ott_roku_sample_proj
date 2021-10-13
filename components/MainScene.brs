sub init()
    m.task = createObject("roSGNode", "ConfigTask")
    m.task.observeField("response", "launchWithConfig")
    m.task.control = "run"
    m.screenStack = {}
    m.top.backgroundUri = ""
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
    m.appConfig = responseEvent.getData()
    for each screen in m.appConfig.screens
        if m.appConfig.screens[screen].showOnLaunch <> invalid
            landingScreen = createScreen(screen, m.appConfig.screens[screen])
            landingScreen.observeField("screenAction", "screenInteraction")
            m.top.appendChild(landingScreen)
        end if
        m.screenStack[screen] = screenObject
    end for
end sub

' function onKeyEvent(key as String, press as Boolean) as Boolean
'
' end function


sub screenInteraction(interactionEvent as Object)
    interaction = interactionEvent.getData()
    actionKey   = interaction.keys()[0]
    actionData  = interaction[actionKey]
    if actionKey = "goTo"
        goToScreen = createScreen(actionData, m.appConfig.screens[actionData])
        m.top.getChild(0).appendChild(goToScreen)
    else if actionKey = "exitApp"
        '
    end if
end sub
