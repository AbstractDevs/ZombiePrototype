package litekit.event;

interface PlatformEventManager
{
    public function enqueue(event:Event):Void;
    public function addListener(eventType:String, handler:Dynamic):Void;
    public function removeListener(eventType:String, handler:Dynamic):Void;
}