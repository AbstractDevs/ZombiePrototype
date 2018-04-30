package litekit.display;

#if openfl
import openfl.display.DisplayObject as OpenFLDisplayObject;
#end

interface DisplayObject
{
    public var priority(default, null):Int;

    #if openfl
    public function getDisplayObj():OpenFLDisplayObject;
    #end
}