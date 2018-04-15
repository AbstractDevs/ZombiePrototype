package litekit.event;

class SimpleEventManager implements PlatformEventManager
{
    private var m_isEnabled:Bool;

    private var m_eventQueue:Array<Event>;
    private var m_eventHandlers:Map<String, Array<Dynamic>>;

    public function new()
    {
        m_isEnabled = true;

        m_eventQueue = new Array<Event>();
        m_eventHandlers = new Map<String, Array<Dynamic>>();
    }

    public function init()
    {
        
    }

    public function enable():Void
    {
        m_isEnabled = true;
    }

    public function disable():Void
    {
        m_isEnabled = false;
    }

    public function enqueue(event:Event):Void
    {
        m_eventQueue.push(event);
    }

    public function addListener(eventType:String, handler:Dynamic):Void
    {
        var eventHandlers:Array<Dynamic> = m_eventHandlers.get(eventType);
        if(eventHandlers == null)
        {
            eventHandlers = new Array<Dynamic>();
        }

        if(eventHandlers.indexOf(handler) == -1)
        {
            eventHandlers.push(handler);
            m_eventHandlers.set(eventType, eventHandlers);
        }   
    }

    public function removeListener(eventType:String, handler:Dynamic):Void
    {
        var eventHandlers:Array<Dynamic> = m_eventHandlers.get(eventType);
        if(eventHandlers != null)
        {
            var handlerIdx:Int = eventHandlers.indexOf(handler);
            if(handlerIdx != -1)
            {
                eventHandlers = eventHandlers.splice(handlerIdx, 1);
                m_eventHandlers.set(eventType, eventHandlers);
            }
        }
    }

    private function processEventQueue():Void
    {
        for(event in m_eventQueue)
        {
            processEvent(event);
        }

        m_eventQueue = [];
    }

    private function processEvent(event:Event):Void
    {
        var eventId:String = event.type;
        var handlers:Array<Dynamic> = m_eventHandlers.get(eventId);
        if(handlers != null)
        {
            for(handler in handlers)
            {
                try {
                    handler(cast event);
                } catch(msg:String) {
                    trace("Error: " + msg);
                }
            }
        }
    }
}