package litekit.component;

import litekit.component.EntityComponentSystem;

interface Component
{
    public var owner(default, null):Entity;
}