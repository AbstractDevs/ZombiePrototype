package litekit.display;

import litekit.display.DisplayObject;

class BaseDisplay
{
    private var m_displayObjs:Array<DisplayObject>;

    private function new()
    {
        m_displayObjs = new Array<DisplayObject>();
    }

    public function attach(obj:DisplayObject):Void
    {
        m_displayObjs.push(obj);
        m_displayObjs.sort(function(objA:DisplayObject, objB:DisplayObject)
        {
            if(objA.priority > objB.priority) return 1;
            else if(objA.priority < objB.priority) return -1;
            return 0;
        });
    }

    public function remove(obj:DisplayObject):Void
    {
        var objIdx:Int = m_displayObjs.indexOf(obj);
        if(objIdx == -1)
        {
            return;
        }

        m_displayObjs.splice(objIdx, 1);
    }
}