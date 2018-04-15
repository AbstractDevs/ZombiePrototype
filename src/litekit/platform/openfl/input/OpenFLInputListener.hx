package litekit.platform.openfl.input;

import litekit.event.PlatformEventManager;
import litekit.event.InputEvent;
import openfl.Lib;
import openfl.events.KeyboardEvent;

class OpenFLInputListener
{
    private static var eventManager:PlatformEventManager;
    public static function init(manager:PlatformEventManager):Void
    {
        eventManager = manager;

        Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    }

    public static function dispose():Void
    {
        eventManager = null;

        Lib.current.stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        Lib.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    }

    private static function onKeyUp(e:KeyboardEvent):Void
    {
        var event:InputEvent = new InputEvent(InputEvent.KEY_UP).setKey(e.keyCode);
        eventManager.enqueue(event);
    }

    private static function onKeyDown(e:KeyboardEvent):Void
    {
        var event:InputEvent = new InputEvent(InputEvent.KEY_DOWN).setKey(e.keyCode);
        eventManager.enqueue(event);
    }
}