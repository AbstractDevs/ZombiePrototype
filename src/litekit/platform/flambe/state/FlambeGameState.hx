package litekit.platform.flambe.state;

import litekit.state.SimpleState;
import litekit.state.SimpleStateMachine;
import litekit.state.State;
import litekit.state.State.StateParams;

class FlambeGameState extends SimpleState
{
    private var m_isInitilized:Bool = false;
    private var m_disposeOnExit:Bool = true;

    private var m_substateManager:SimpleStateMachine;

    public function new(id:StateId)
    {
        super(id, onEnter, onExit);
    }

    private function init(?params:StateParams):Null<StateParams>
    {
        m_substateManager = new SimpleStateMachine();

        m_isInitilized = true;
        return params;
    }

    private function dispose(?params:StateParams):Null<StateParams>
    {
        m_substateManager = null;

        m_isInitilized = false;
        return params;
    }

    private function onEnter(?params:StateParams):Null<StateParams>
    {
        if(!m_isInitilized)
        {
            params = init(params);
        }

        return params;
    }

    private function onExit(?params:StateParams):Null<StateParams>
    {
        return params;
    }
}