package litekit.display;

#if openfl
import openfl.display.DisplayObjectContainer;
#end

interface Display
{
    public function attach(obj:DisplayObject):Void;
    public function remove(obj:DisplayObject):Void;

    #if openfl
    public function init(displayRoot:DisplayObjectContainer):Void;
    #end
}