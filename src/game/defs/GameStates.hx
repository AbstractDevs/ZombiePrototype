package game.defs;

import game.Global;
import game.state.gameplay.GameplayState;
import game.state.inputTest.InputTestState;
import game.state.maptest.MapTestState;

@:enum
abstract GameState(String) from String to String
{
    var GAMEPLAY = "GAMEPLAY_STATE";

    //Tests
    var INPUT_TEST = "INPUT_TEST_STATE";
    var MAP_TEST = "MAP_TEST_STATE";
}

class GameStates
{
    public static function init()
    {
        Global.state.addState(new GameplayState());

        //Test States
        Global.state.addState(new InputTestState());
        Global.state.addState(new MapTestState());
    }
}