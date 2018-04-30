package game.level;

import litekit.event.Event;

class GameLevelEvent implements Event
{
    public static inline var OBJECT_CREATED:String = "GAME_LEVEL_EVENT_OBJECT_CREATED";
    public static inline var OBJECT_DESTROYED:String = "GAME_LEVEL_EVENT_OBJECT_DESTROYED";

    public var type(default, null):String;
    public var gameObj(default, null):GameObject;

    public function new(type:String)
    {
        this.type = type;
    }

    public function setObject(obj:GameObject):GameLevelEvent
    {
        this.gameObj = obj;
        return this;
    }
}