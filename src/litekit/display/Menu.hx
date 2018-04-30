package litekit.display;

interface Menu
{
    public function hasObject(id:String, type:Class<Dynamic>):Bool;
    public function getObject(id:String):Dynamic;
    public function getObjectAs<T>(id:String, type:Class<T>):T;
}