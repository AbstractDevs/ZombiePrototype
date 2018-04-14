package litekit.input;

typedef KeyBind = 
{
    var key:Int;
    var modifiers:Array<Int>;
}

class InputManager
{
    private static var ms_inputKeyRegistry(get, null):Map<String, KeyBind>;
    private static function get_ms_inputKeyRegistry():Map<String, KeyBind>
    {
        return ms_inputKeyRegistry != null ? ms_inputKeyRegistry : ms_inputKeyRegistry = new Map<String, Keybrind>;
    }

    public static function registerInputKey(key:String, ?defaultKeyBind:KeyBind = null):Void
    {
        ms_inputKeyRegistry.set(key, defaultKeyBind);
    }

    public static function getInputKey(key:String):Null<KeyBind>
    {
        var bind:KeyBind = ms_inputKeyRegistry.get(key);
        return bind;
    }
}