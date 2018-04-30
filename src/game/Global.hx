package game;

import litekit.display.Display;
import litekit.event.PlatformEventManager;
import litekit.state.SimpleStateMachine;

#if openfl
import litekit.platform.openfl.event.OpenFLEventManager;
import litekit.platform.openfl.display.OpenFLDisplay;
import openfl.Lib;
#end

class Global
{
    public static var state(default, null):SimpleStateMachine;
    public static var event(default, null):PlatformEventManager;
    public static var display(default, null):Display;

    public static function init():Void
    {
        state = new SimpleStateMachine();
        
        #if openfl
        event = new OpenFLEventManager();
        #elseif flambe
        //TODO: Add the flambe event manager here
        #end
        event.init();

        #if openfl
        display = new OpenFLDisplay();
        display.init(Lib.current.stage);
        #end

    }
}