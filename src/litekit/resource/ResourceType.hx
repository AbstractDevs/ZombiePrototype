package litekit.resource;

@:enum
abstract ResourceType(String) to String from String
{
    var FILE = "file";
    var IMAGE = "image";
    var SOUND = "sound";
}