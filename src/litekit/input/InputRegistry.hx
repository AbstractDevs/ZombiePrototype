package litekit.input;

typedef KeyBind = 
{
    var key:Int;
    var modifiers:Array<Int>;
}

class InputRegistry
{
    private static var ms_inputKeyRegistry(get, null):Map<String, KeyBind>;
    private static function get_ms_inputKeyRegistry():Map<String, KeyBind>
    {
        return ms_inputKeyRegistry != null ? ms_inputKeyRegistry : ms_inputKeyRegistry = new Map<String, KeyBind>();
    }

    public static function registerInput(key:String, ?defaultKeyBind:KeyBind = null):Void
    {
        ms_inputKeyRegistry.set(key, defaultKeyBind);
    }

    public static function getInputRegistery(key:String):Null<KeyBind>
    {
        var bind:KeyBind = ms_inputKeyRegistry.get(key);
        return bind;
    }

    public static function getAllInputRegistries():Map<String, KeyBind>
    {
        var inputMap:Map<String, KeyBind> = new Map<String, KeyBind>();
        for(key in ms_inputKeyRegistry.keys())
        {
            inputMap[key] = ms_inputKeyRegistry[key];
        }

        return inputMap;
    }
}