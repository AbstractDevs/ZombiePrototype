package litekit.state;

import litekit.state.State;

class SimpleState implements State
{
	public var id(default, null):StateId;
	
	private var m_enterFunc:Null<StateParams->StateParams>;
	private var m_exitFunc:Null<StateParams->StateParams>;

	public function new(id:StateId, enter:StateParams->StateParams, exit:StateParams->StateParams)
	{
		this.id = id;
		m_enterFunc = enter;
		m_exitFunc = enter;
	}

	public function enter(?params:StateParams):Null<StateParams>
	{
		if(m_enterFunc != null)
		{
			return m_enterFunc(params);
		}

		return null;
	}

	public function exit(?params:StateParams):Null<StateParams>
	{
		if(m_exitFunc != null)
		{
			return m_exitFunc(params);
		}

		return null;
	}
}