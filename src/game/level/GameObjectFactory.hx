package game.level;

import game.level.GameObject;

class GameObjectFactory
{
    public static function createObject(params:GameObjectParams):GameObject
    {
        var objClass:Class<Dynamic> = Type.resolveClass(params.type);
        trace(params.type);

        if(objClass == null)
        {
            trace('Unable to create an object with type: ${params.type}');
            return null;
        }

        var obj = Type.createInstance(objClass, params.args);
        return obj;
    }
}