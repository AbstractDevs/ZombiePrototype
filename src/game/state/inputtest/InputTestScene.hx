package game.state.inputtest;

import game.Global;
import litekite.state.StateParams;
import openfl.display.Sprite;

class InputTestScene
{
    private var sprite(default, null):Sprite;

    public function new()
    {
        sprite = new Sprite();
        sprite.graphics.beginFill(0xAAAAAA);
        sprite.graphics.drawRect(0, 0, 900, 900);
        sprite.graphics.endFill();
    }

    override function onEnter(params:StateParams):StateParams
    {

        return params;
    }

    private function onInput(e:input)
}