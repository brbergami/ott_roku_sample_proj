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
    createButtons(config.buttons)
end sub

sub createButtons(buttons as Object)
    buttonGroup = m.top.createChild("ButtonGroup")
    m.buttonLabels = []
    m.actionButtons = {}
    for each button in buttons
        m.buttonLabels.push(button.title)
        m.actionButtons[button.title] = button.action
    end for
    buttonGroup.translation    = [m.displaySize.w * 0.43, m.displaySize.h * 0.6]
    buttonGroup.buttons        = m.buttonLabels
    buttonGroup.iconUri        = ""
    buttonGroup.focusedIconUri = ""
    buttonGroup.setFocus(true)
    buttonGroup.observeField("buttonSelected", "onButtonSelected")
end sub

sub onButtonSelected(buttonPress as Object)
    m.top.screenAction = m.actionButtons[m.buttonLabels[buttonPress.getData()]]
end sub
