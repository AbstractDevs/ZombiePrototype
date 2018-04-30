package game.level;

import litekit.component.BaseComponent;
import litekit.math.Rectangle;

class Hitbox extends BaseComponent
{
    private var m_rect:Rectangle;

    public function new()
    {
        super();
    }

    public function collidesWith(hitbox:Hitbox):Bool
    {
        var rect:Rectangle = hitbox.getRect();
        return m_rect.collidesWith(rect);
    }

    public function getRect():Rectangle
    {
        return m_rect.copy();
    }
}