sub init()
    m.displaySize = createObject("roDeviceInfo").getDisplaySize()
    _bindComponents()
end sub

sub _bindComponents()
    m.title       = m.top.findNode("screenTitle")
    m.description = m.top.findNode("screenDescription")
    m.background  = m.top.findNode("background")
end sub

sub configureScreen(config as Object)
    config = config.getData()
    m.background.width        = m.displaySize.w
    m.background.height       = m.displaySize.h
    m.background.color        = config.background
    m.title.text              = config.title
    m.title.translation       = [m.displaySize.w * 0.45, m.displaySize.h * 0.25] ' well, seems like SG getDisplaySize reports max 720p screen on old devices and renders ugly..
    m.title.font.size         = 48
    m.description.text        = config.description
    m.description.translation = [m.displaySize.w * 0.38, m.displaySize.h * 0.33] ' I should substract here witdh and height of the Label too, but doesn't seems to update (0) after setting the text
    m.description.font.size   = 24
    m.buttons                 = config.buttons
    if config.buttons <> invalid then createButtons(m.buttons)
end sub

sub createButtons(buttons as Object)
    buttonGroup = m.top.createChild("ButtonGroup")
    buttonGroup.translation = [0, 0]
    buttonGroup.layoutDirection = "horiz"
    actionMap = {}
    for each button in buttons
        actionMap[button.title] = button.action
    end for
end sub

'{
'    "Watch Movies": {
'        "goTo": "moviesScreen"
'    },
'    "Exit App": {
'        "exitApp": true
'    }
'}