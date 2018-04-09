package litekit.resource;

import haxe.Json;

typedef ResourceData = 
{
    var id:String;
    var type:ResourceType;
    var pack:String;
    var path:String;
}

private typedef ManifestData =
{
    var id:String;
    var assets:Array<ResourceData>;
}

class ResourceManifest
{
    private var m_manifestId:String;
    private var m_resources:Map<String, ResourceData>;

    public function new(data:String)
    {
        m_resources = new Map<String, ResourceData>();
        parseData(data);
    }

    public function getAllResourceData():Array<ResourceData>
    {
        var resources = [];
        for(key in m_resources.keys())
        {
            resources.push(m_resources.get(key));
        }

        return resources;
    }

    public function getResourceData(id:String):Null<ResourceData>
    {
        return m_resources.get(id);
    }

    private function parseData(data:String):Void
    {
        var manifestData:ManifestData = cast Json.parse(data);
        if(manifestData == null)
        {
            trace("There was an error parsing manifest data: \n" + data);
            return;
        } 

        m_manifestId = manifestData.id;

        for(entry in manifestData.assets)
        {
            m_resources.set(entry.id, entry);
        }
    }
}