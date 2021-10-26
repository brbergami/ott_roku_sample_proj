sub init()
    m.displaySize = createObject("roDeviceInfo").getDisplaySize()
    _bindComponents()
end sub

sub _bindComponents()
    m.overhang   = m.top.findNode("overhang")
    m.background = m.top.findNode("background")
end sub

sub configureScreen(config as Object)
    config = config.getData()
    m.background.width        = m.displaySize.w
    m.background.height       = m.displaySize.h
    m.background.color        = config.background
    m.overhang.title          = config.title
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press
        counter = m.top.getChildCount()
        if key = "back"
            if counter > 3
                m.top.removeChildIndex(counter-1)
                handled = true
            else
                handled = true
            end if
        end if
    end if
    return handled
end function
