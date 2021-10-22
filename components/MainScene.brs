sub init()
    m.top.backgroundUri = ""
    m.task = createObject("roSGNode", "ConfigTask")
    m.task.observeField("response", "launchWithConfig")
    m.task.control = "run"
    m.screenStack = {}
end sub

sub launchWithConfig(responseEvent as Object)
    m.task.unobserveField("response")
    m.task.control = "stop"
    m.appConfig = responseEvent.getData()
    for each screen in m.appConfig.screens
        if m.appConfig.screens[screen].showOnLaunch <> invalid
            landingScreen = createScreen(screen, m.appConfig.screens[screen])
            landingScreen.observeField("screenAction", "screenInteraction")
            m.top.appendChild(landingScreen)
        end if
    end for
end sub

function createScreen(screen as String, withConfig as Object) as Object
    screenObject = createObject("roSGNode", screen)
    screenObject.config = withConfig
    return screenObject
end function

sub screenInteraction(interactionEvent as Object)
    interaction = interactionEvent.getData()
    actionKey   = interaction.keys()[0]
    actionData  = interaction[actionKey]
    if actionKey = "goTo"
        goToScreen = createScreen(actionData, m.appConfig.screens[actionData])
        m.top.getChild(0).appendChild(goToScreen)
    else if actionKey = "exitApp"
        m.top.exitApp = true
    end if
end sub
