package;

import openfl.display.Sprite;
import openfl.events.Event;

import game.Global;
import game.defs.GameStates;

class Main extends Sprite 
{
    public function new () 
    {
        super();
        
        this.addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(e:Event):Void
    {
        this.removeEventListener(Event.ADDED_TO_STAGE, init);

        Global.init();
        GameStates.init();

        Global.state.setState(GameState.INPUT_TEST);
    }

}