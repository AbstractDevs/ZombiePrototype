package game.state;

import litekit.state.SimpleState;
import litekit.state.State;

class BaseGameState extends SimpleState
{
    private function new(id:StateId)
    {
        super(id, onEnter, onExit);
    }

    private function onEnter(params:StateParams):StateParams
    {
        return params;
    }

    private function onExit(params:StateParams):StateParams
    {
        return params;
    }
}