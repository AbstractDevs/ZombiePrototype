package litekit.platform.flambe.resource;

import flambe.asset.Manifest;
import litekit.resource.ResourceManifest;

using litekit.platform.flambe.utils.FlambeUtils;

class FlambeResourceLoader implements PlatformResourceLoader
{
    //Loaders
    private static var ms_currentLoader:Promise<AssetPack>;
    private static var ms_loaders:Array<Promise<AssetPack>>;
    private static var ms_packKeys:Array<String>;
    
    //Load Progress
    private static var ms_totalLoad:Float;
    private static var ms_loadProgress:Float;

    //Signal Connections
    private static var ms_currentLoadProgressSignal:SignalConnection;

    public static function isBusy():Bool
    {
        return ms_totalLoad != null;
    }

    /**
     *  Returns the progress of all active loads
     *  @return Float   Progress of the load, range 0 to 1
     */
    public static function getLoadProgress():Float
    {
        if(ms_currenLoader == null || ms_loadProgress == null || ms_totalLoad == 0)
        {
            return 0;
        }

        var progress:Float = ms_loadProgress + ms_currenLoader.progress;
        return progress / ms_totalLoad;
    }

    public static function addManifest(manifest:ResourceManifest):Void
    {
        var loadManifest:Manifest = new Manifest();
    }

    public static function startLoad():Void
    {
        if(ms_loaders == null && ms_loaders.length == 0)
        {
            onAllLoadsComplete();
        }
        else
        {
            loadNextPack();
        }
    }

    private static function loadNextPack():Void
    {
        if(ms_currentLoader != null)
        {
            trace('Attempted to load the next pack, but we haven\'t diposed our current one!');
            return;
        }

        ms_currentLoader = ms_loaders.shift();
        ms_currentLoadProgressSignal = ms_currentLoader.progressChanged.connect(onLoadProgress);
    }

    private static function onPackLoaded(pack:AssetPack):Void
    {
        ms_currentLoadProgressSignal.safeDispose();
    }

    private static function onAllLoadsComplete():Void
    {
        //TODO: Emit event here
    }
}