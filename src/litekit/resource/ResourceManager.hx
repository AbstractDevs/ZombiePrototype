package litekit.resource;

typedef ResourceId = String;

interface ResourceManager
{
    public static function setResource(id:ResourceId, resource:Dynamic, type:ResourceType):Void;

    public static function getLoadedResources():Array<ResourceId>;
}