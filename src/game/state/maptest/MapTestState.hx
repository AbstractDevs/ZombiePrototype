package game.state.maptest;

import game.Global;
import game.defs.GameStates;
import game.level.GameLevel;
import game.level.GameTile;
import game.level.GameLevelEvent;
import game.level.GameObject;
import game.state.BaseGameState;
import litekit.display.DisplayObject;
import litekit.state.State;

class MapTestState extends BaseGameState
{
    private var m_testLevel:GameLevel;

    public function new()
    {
        super(GameState.MAP_TEST);
    }

    override function onEnter(params:StateParams):StateParams
    {
        params = super.onEnter(params);

        trace("Logging - Entered MapTestState");
        Global.event.addListener(GameLevelEvent.OBJECT_CREATED, onObjectCreated);
        Global.event.addListener(GameLevelEvent.OBJECT_DESTROYED, onObjectDestroyed);
        
        m_testLevel = new GameLevel();

        var testParams:GameObjectParams = {
            type : "game.level.GameTile",
            args : []
        };
        m_testLevel.createGameObj(testParams);

        return params;
    }

    override function onExit(params:StateParams):StateParams
    {
        params = super.onExit(params);

        Global.event.removeListener(GameLevelEvent.OBJECT_CREATED, onObjectCreated);
        Global.event.removeListener(GameLevelEvent.OBJECT_DESTROYED, onObjectDestroyed);
        
        return params;
    }

    private function onObjectCreated(e:GameLevelEvent):Void
    {
        var obj = e.gameObj;
        trace(Std.is(obj, GameTile));
        if(Std.is(obj, DisplayObject))
        {
            trace("Adding an object to display");
            Global.display.attach(cast obj);
        }
    }

    private function onObjectDestroyed(e:GameLevelEvent):Void
    {
        var obj = e.gameObj;
        if(Std.is(obj, DisplayObject))
        {
            Global.display.remove(cast obj);
        }
    }
}