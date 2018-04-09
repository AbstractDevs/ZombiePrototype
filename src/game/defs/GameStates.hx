package game.defs;

import game.Global;
import game.state.gameplay.GameplayState;
import game.state.inputTest.InputTestState;

@:enum
abstract GameState(String) from String to String
{
    var GAMEPLAY = "GAMEPLAY_STATE";

    //Tests
    var INPUT_TEST = "INPUT_TEST_STATE";
}

class GameStates
{
    public static function init()
    {
        Global.state.addState(new GameplayState());

        Global.state.addState(new InputTestState());
    }
}