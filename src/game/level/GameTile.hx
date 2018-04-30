package game.level;

import game.level.GameObject;
import litekit.display.DisplayObject;
import openfl.display.DisplayObject as OpenFLDisplayObject;
import openfl.display.Sprite;

class GameTile extends GameObject implements DisplayObject
{
    public var priority(default, null):Int;

    private var m_sprite:Sprite;

    public function new(params:GameObjectParams)
    {
        super(params);

        m_sprite = new Sprite();

        //Placeholder
        m_sprite.graphics.beginFill(0x000000);
        m_sprite.graphics.drawRect(0, 0, 100, 100);
        m_sprite.graphics.endFill();
    }

    public function getDisplayObj():OpenFLDisplayObject
    {
        return m_sprite;
    }
}