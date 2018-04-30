package game.level;

import litekit.component.BaseComponent;

typedef GameObjectParams = {
    var type:String;
    var args:Array<Dynamic>;
};

class GameObject extends BaseComponent
{
    public var worldX(default, null):Float = 0;
    public var worldY(default, null):Float = 0;

    public function new(params:GameObjectParams)
    {
        super();
    }

    public function setWorldX(pos:Float):GameObject
    {
        this.worldX = pos;
        return this;
    }

    public function setWorldY(pos:Float):GameObject
    {
        this.worldY = pos;
        return this;
    }
}