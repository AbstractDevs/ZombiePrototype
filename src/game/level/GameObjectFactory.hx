package game.level;

import game.level.GameObject;

class GameObjectFactory
{
    public static function createObject(params:GameObjectParams):GameObject
    {
        var objClass:Class<Dynamic> = Type.resolveClass(params.type);
        
        if(objClass == null)
        {
            return null;
        }

        var obj = Type.createInstance(objClass, params.args);
        return obj;
    }
}