package litekit.state;

typedef StateParams = Map<String, Dynamic>;
typedef StateId = String;

interface State
{
	public var id(default, null):StateId;

	public function enter(?params:StateParams):StateParams;
	public function exit(?params:StateParams):StateParams;
}