package litekit.event;

class SimpleEventManager implements PlatformEventManager
{
    private var m_isEnabled:Bool;

    private var m_eventQueue(get, null):Array<Event>;

    public function new()
    {
        m_isEnabled = true;
        
        m_eventQueue = new Array<Event>();
    }

    public function init():Void
    {

    }

    public function enable():Bool
    {
        m_isEnabled = true;
    }

    public function disable():Bool
    {
        m_isEnabled = false;
    }

    public function enqueue(event:Event):Void
    {
        m_eventQueue.push(event);
    }

    public function addListener(eventType:String, handler:Dynamic):Void
    {

    }

    public function removeListener(eventType:String, handler:Dynamic):Void
    {

    }

    private function processEventQueue():Void
    {

    }
}