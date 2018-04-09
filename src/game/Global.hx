package game;

import litekit.event.EventManager;
import litekit.state.SimpleStateMachine;

#if openfl
import litekit.platform.openfl.OpenFLEventManager;
#end

class Global
{
    public static var state(default, null):SimpleStateMachine;
    public static var event(default, null):EventManager;

    public static function init():Void
    {
        state = new SimpleStateMachine();
        
        #if openfl
        event = new OpenFLEventManager();
        #end
    }
}