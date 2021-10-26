sub init()
    m.displaySize = createObject("roDeviceInfo").getDisplaySize()
    _bindComponents()
end sub

sub _bindComponents()
    m.overhang    = m.top.findNode("overhang")
    m.background  = m.top.findNode("background")
    m.buttonGroup = m.top.findNode("buttonGroup")
end sub

sub configureScreen(config as Object)
    config = config.getData()
    m.background.width        = m.displaySize.w
    m.background.height       = m.displaySize.h
    m.background.color        = config.background
    m.overhang.title          = config.title
    createButtons(config.buttons)
end sub

sub createButtons(buttons as Object)
    m.buttonLabels  = []
    m.actionButtons = {}
    for each button in buttons
        m.buttonLabels.push(button.title)
        m.actionButtons[button.title] = button.action
    end for
    m.buttonGroup.translation = [m.displaySize.w * 0.1, m.displaySize.h * 0.86]
    m.buttonGroup.buttons     = m.buttonLabels
    m.buttonGroup.setFocus(true)
    m.buttonGroup.observeField("buttonSelected", "onButtonSelected")
end sub

sub onButtonSelected(buttonPress as Object)
    m.top.screenAction = m.actionButtons[m.buttonLabels[buttonPress.getData()]]
end sub
