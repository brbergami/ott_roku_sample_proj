sub main()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("MainScene")
    screen.show()
    scene.observeField("exitApp", m.port)

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if (msgType = "roSGScreenEvent" AND msg.isScreenClosed()) OR (msgType = "roSGNodeEvent" AND msg.getField() = "exitApp")
            return
        end if
    end while
end sub
