package litekit.resource;

interface ResourceLoader
{
    public static function isBusy():Bool;
    public static function getLoadProgress():Float;
    
    public static function addManifest(manifest:ResourceManifest):Void;
    public static function startLoad():Void;
}