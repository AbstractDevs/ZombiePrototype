package game.level.tile;

import game.level.GameObject;
import litekit.display.DisplayObject;
import openfl.display.DisplayObject as OpenFLDisplayObject;
import openfl.display.Sprite;

@:keep
class GameTile extends GameObject implements DisplayObject
{
    private static inline var TILE_COLOR:Int = 0xb3b3b3;
    private static inline var TILE_WIDTH:Float = 100;
    private static inline var TILE_DEPTH:Float = 35;
    private static inline var TILE_HEIGHT:Float = 20;
    private static inline var ROTATION_OFFSET:Float = 30;

    public var priority(default, null):Int;

    private var m_sprite:Sprite;

    public function new(params:GameObjectParams)
    {
        super(params);

        m_sprite = new Sprite();
        m_sprite.x = 400;
        m_sprite.y = 500;

        //Placeholder - Draw Top
        m_sprite.graphics.beginFill(TILE_COLOR);
        m_sprite.graphics.lineStyle(2, 0x000000);
        m_sprite.graphics.moveTo(ROTATION_OFFSET, 0);
        m_sprite.graphics.lineTo(TILE_WIDTH + ROTATION_OFFSET, 0);
        m_sprite.graphics.lineTo(TILE_WIDTH, TILE_DEPTH);
        m_sprite.graphics.lineTo(0, TILE_DEPTH);
        m_sprite.graphics.lineTo(ROTATION_OFFSET, 0);

        //Placeholder - Draw Left
        m_sprite.graphics.moveTo(0, TILE_DEPTH);
        m_sprite.graphics.lineTo(0, TILE_DEPTH + TILE_HEIGHT);
        m_sprite.graphics.lineTo(TILE_WIDTH, TILE_DEPTH + TILE_HEIGHT);
        m_sprite.graphics.lineTo(TILE_WIDTH, TILE_DEPTH);

        //Placeholder - Draw Right
        m_sprite.graphics.moveTo(TILE_WIDTH, TILE_DEPTH);
        m_sprite.graphics.lineTo(TILE_WIDTH, TILE_DEPTH + TILE_HEIGHT);
        m_sprite.graphics.lineTo(TILE_WIDTH + ROTATION_OFFSET, TILE_HEIGHT);
        m_sprite.graphics.lineTo(TILE_WIDTH + ROTATION_OFFSET, 0);
        m_sprite.graphics.lineTo(TILE_WIDTH, TILE_DEPTH);

        m_sprite.graphics.endFill();
    }

    public function getDisplayObj():OpenFLDisplayObject
    {
        return m_sprite;
    }
}