package litekit.state;

import litekit.state.State.StateId;
import litekit.state.State.StateParams;

class SimpleStateMachine
{
	private var m_currentState:State;
	private var m_states:Map<StateId, State>;

	public function new()
	{
		m_states = new Map<StateId, State>();
	}

	public function addState(state:State):Void
	{
		if(m_states.exists(state.id))
		{
			trace('A state already exists with id: ${state.id}');
			return;
		}

		m_states.set(state.id, state);
	}

	public function setState(id:String, ?params:StateParams):Null<StateParams>
	{
		if(!m_states.exists(id))
		{
			trace('Unable to find a state with id: ${id}');
			return null;
		}

		var nextState:State = m_states.get(id);
		if(nextState == null)
		{
			trace('Attempted to set state to id: ${id} but that state is null!');
			return null;
		}

		var enterParams:StateParams = params;
		if(m_currentState != null)
		{
			var exitParams:StateParams = m_currentState.exit(params);	
			if(exitParams != null)
				enterParams = exitParams;
		}

		m_currentState = nextState;
		return m_currentState.enter(enterParams);
	}
}