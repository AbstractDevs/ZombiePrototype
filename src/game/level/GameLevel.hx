package game.level;

import litekit.component.EntityComponentSystem;
import game.level.GameObject;
import game.level.GameLevelEvent;
import game.level.GameObjectFactory;
import game.Global;

class GameLevel
{
    private var m_player:Entity;
    private var m_entities:Array<Entity>;

    public function new()
    {

    }

    public function createGameObj(params:GameObjectParams):GameObject
    {
        var obj:GameObject = GameObjectFactory.createObject(params);

        var event = new GameLevelEvent(GameLevelEvent.OBJECT_CREATED)
            .setObject(obj);
        Global.event.enqueue(event);

        return obj;
    }
}