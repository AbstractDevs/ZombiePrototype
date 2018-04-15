package litekit.event;

class InputEvent implements Event
{
    public static inline var KEY_DOWN:String = "INPUT_KEY_DOWN";
    public static inline var KEY_UP:String = "INPUT_KEY_UP";

    public var type(default, null):String;

    //Keyboard
    public var key(default, null):Int;

    public function new(type:String)
    {
        this.type = type;
    }

    public function setKey(key:Int):InputEvent
    {
        this.key = key;
        return this;
    }
}