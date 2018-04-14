package litekit.platform.openfl;

import litekit.event.SimpleEventManager;

import openfl.Lib;
import openfl.events.Event;

class OpenFLEventManager extends SimpleEventManager
{
    public function new()
    {
        super();
    }

    override function init():Void
    {
        super.init();

        Lib.current.stage.addEventListener(Event.ENTER_FRAME, onEnterFrame)
    }

    private function onEnterFrame(e:Event):Void
    {
        processEventQueue();
    }
}