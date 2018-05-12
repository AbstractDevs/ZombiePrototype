package game.level.actor;

import litekit.component.BaseComponent;
import litekit.display.DisplayObject;
import openfl.display.Sprite;
import openfl.display.DisplayObject as OpenFLDisplayObject;

class Player extends BaseComponent implements DisplayObject
{
    public var priority(default, null):Int;

    private var m_sprite:Sprite;

    public function new()
    {
        super();
    }

    public function getDisplayObj():OpenFLDisplayObject
    {
        return m_sprite;
    }
}