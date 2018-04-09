package litekit.platform.flambe.utils;

class FlambeUtils
{
    public static function safeDispose(obj:Disposable):Void
    {
        if(obj != null)
        {
            obj.dispose();
            obj = null;
        }
    }
}