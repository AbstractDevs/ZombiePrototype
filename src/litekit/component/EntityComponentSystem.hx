package litekit.component;

import litekit.component.Component;
import litekit.utils.UUID;

typedef Entity = String;

class EntityComponentSystem
{
    private static var ms_entityMap(get, null):Map<Entity, Array<Component>>;
    private static function get_ms_entityMap():Map<Entity, Array<Component>>
    {
        return ms_entityMap != null ? ms_entityMap : ms_entityMap = new Map<Entity, Array<Component>>();
    }

    public static function create(?id:Entity):Null<Entity>
    {
        if(id != null && ms_entityMap.exists(id))
        {
            trace('Attempted to create an entity with specified id \'${id}\' but we already have that id!');
            return null;
        }

        var entity:Entity = UUID.create();
        var components:Array<Component> = new Array<Component>();
        ms_entityMap.set(entity, components);

        return id;
    }

    public static function remove(entity:Entity):Void
    {
        if(ms_entityMap.exists(entity))
        {
            ms_entityMap.remove(entity);
        }
    }

    public static function add(entity:Entity, component:Component):Void
    {
        var components:Array<Component> = ms_entityMap.get(entity);
        if(components == null)
        {
            trace('Unable to find an entity being tracked with id \'${entity}\'');
        }

        components.push(component);
    }

    public static function get<T>(entity:Entity, componentType:Class<T>):T
    {
        var components:Array<Component> = getAllComponents(entity);
        for(component in components)
        {
            if(Std.is(component, componentType))
            {
                return cast component;
            }
        }

        return null;
    }

    public static function getAllComponents(entity:Entity):Array<Component>
    {
        if(ms_entityMap.exists(entity))
        {
            return ms_entityMap.get(entity);
        }

        return [];
    }
}