sub init()
    m.displaySize = createObject("roDeviceInfo").getDisplaySize() ' TBD: get this only from abstract class
    _bindComponents()
    _applyStyles()
end sub

sub _bindComponents()
    m.overhang   = m.top.findNode("overhang")
    m.background = m.top.findNode("background")
    m.rowList    = m.top.findNode("rowList")
end sub

sub _applyStyles()
    m.rowList.translation = [m.displaySize.w * 0.25, m.displaySize.h * 0.66]
end sub

sub configureScreen(config as Object) ' Decouple this better from parent class
    config = config.getData()
    m.background.width        = m.displaySize.w
    m.background.height       = m.displaySize.h
    m.background.color        = config.background
    m.overhang.title          = config.title
    createGrid(config.movies)
end sub

sub createGrid(movies as Object)

end sub
