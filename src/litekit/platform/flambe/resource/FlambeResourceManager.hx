package litekit.platform.flambe.resource;

class FlambeResourceManager
{
    public static function addResource(id:String, type:ResourceType, asset:Dynamic):Void;
    public static function removeResource(id:String):Void;

    public static function addSprite(sprite:LiteSprite):Void;
    public static function getSprite(id:String):Null<LiteSprite>;

    public static function addSound(sound:LiteSound):Void;
    public static function getSound(id:String):Null<LiteSound>;

    public static function addFile(file:LiteFile):Void;
    public static function getFile(id:String):Null<LiteFile>;
}