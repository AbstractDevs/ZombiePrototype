package litekit.event;

#if flambe
import package litekit.platform.flambe.event.FlambeEventManager;
#end

class EventManager
{
    private static var m_platformImpl:PlatformEventManager;
    private static var m_isInitilized:Bool = false;

    public static function init():Void
    {
        if(m_isInitilized)
        {
            trace('Attempted to call init() on EventManager, but it is already initilized!');
            return;
        }

        #if flambe
        m_platformImpl = new FlambeEventManager();
        #elseif openfl

        #end

        m_isInitilized = true;
    }

    public static function enqueue(event:Event):Void
    {
        m_platformImpl.enqueue(event);
    }

    public static function addListener(eventType:String, handler:Dynamic):Void
    {
        m_platformImpl.addListener(eventType, handler);
    }
    
    public static function removeListener(eventType:String, handler:Dynamic):Void
    {
        m_platformImpl.removeListener(eventType, handler);
    }
}