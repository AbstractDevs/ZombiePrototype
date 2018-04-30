package litekit.platform.openfl.display;

import litekit.display.BaseDisplay;
import litekit.display.Display;
import litekit.display.DisplayObject;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;

class OpenFLDisplay extends BaseDisplay implements Display
{
    private var m_displayRoot:DisplayObjectContainer;

    public function new()
    {
        super();

        m_displayRoot = new Sprite();
    }

    public function init(displayRoot:DisplayObjectContainer):Void
    {
        m_displayRoot = displayRoot;
    }

    override function attach(obj:DisplayObject):Void
    {
        super.attach(obj);

        var displayObject = obj.getDisplayObj();
        m_displayRoot.addChildAt(displayObject, 0);
        trace("Attaching object");
    }

    override function remove(obj:DisplayObject):Void
    {
        super.remove(obj);

        var displayObject = obj.getDisplayObj();
        m_displayRoot.removeChild(displayObject);
    }


}