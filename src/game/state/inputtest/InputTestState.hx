package game.state.inputTest;

import game.Global;
import game.defs.GameStates;
import game.state.BaseGameState;
import litekit.event.InputEvent;
import litekit.state.State;


class InputTestState extends BaseGameState
{
    public function new()
    {
        super(GameState.INPUT_TEST);
    }

    override function onEnter(params:StateParams):StateParams
    {
        params = super.onEnter(params);

        trace("Logging - Entered TestState");

        Global.event.addListener(InputEvent.KEY_DOWN, onKeyPress);

        return params;
    }

    override function onExit(params:StateParams):StateParams
    {
        params = super.onExit(params);

        return params;
    }

    private function onKeyPress(e:InputEvent):Void
    {
        trace('Pressed key: ${e.key}');
    }
}