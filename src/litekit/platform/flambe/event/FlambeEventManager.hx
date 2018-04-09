package litekit.platform.flambe.event;

class FlambeEventManager implements EventManager extends Component
{
    private var m_eventQueue:Array<Event>;
    private var m_handlers:Map<String, Array<Event->Void>>;

    public function new()
    {
        m_eventQueue = new Array<Event>();
        m_handlers = new Map<String, Dynamic>();
        System.root.add(this);
    }

    public function enqueue(event:Event):Void
    {
        m_eventQueue.push(event);
    }

    public function addListener(eventType:String, handler:Dynamic):Void
    {
        var eventHandlers:Array<Event> = [];
        if(m_handlers.exists(eventType))
        {
            eventHandlers = m_handlers.get(eventType);
        }

        eventHandlers.push(handler);
        m_handlers.set(eventType, handler);
    }

    public function removeListener(eventType:String, handler:Dynamic):Void
    {
        if(!m_handlers.exists(eventType))
        {
            return;
        }

        if(m_handlers.get(eventType))
    }

    override function onUpdate(dt:Float):Void
    {
        for(event in m_eventQueue)
        {
            
        }

        m_queue = [];
    }
}