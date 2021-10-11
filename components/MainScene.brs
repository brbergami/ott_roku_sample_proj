sub init()
    m.task = createObject("roSGNode", "ConfigTask")
    m.task.observeField("response", "launchWithConfig")
    m.task.control = "run"
end sub

sub launchWithConfig(responseEvent as Object)
    m.task.control = "stop"
    appConfig = responseEvent.getData()
    stop
end sub
