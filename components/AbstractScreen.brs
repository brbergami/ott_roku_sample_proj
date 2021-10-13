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
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press
        counter = m.top.getChildCount()
        if key = "back"
            if counter > 2
                m.top.removeChildIndex(counter-1)
                handled = true
            else
                handled = true
            end if
        end if
    end if
    return handled
end function
