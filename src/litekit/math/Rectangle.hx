package litekit.math;

class Rectangle
{
    public var x:Float;
    public var y:Float;
    public var width:Float;
    public var height:Float;

    //Virtual Properties
    public var top(get, null):Float;
    public var bottom(get, null):Float;
    public var left(get, null):Float;
    public var right(get, null):Float;

    private function get_top():Float
    {
        return height >= 0 ? y : y + height;
    }

    private function get_bottom():Float
    {
        return height >= 0 ? y + height : y;
    }

    private function get_left():Float
    {
        return width >= 0 ? x : x + width;
    }

    private function get_right():Float
    {
        return width >= 0 ? x + width : x;
    }

    public function new(x:Float, y:Float, width:Float, height:Float)
    {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    public function collidesWith(rect:Rectangle):Bool
    {
        return Rectangle.checkForCollision(this, rect);
    }

    /****************************************
     *              UTILITY
     ***************************************/

    public function copy():Rectangle
    {
        return new Rectangle(this.x, this.y, this.width, this.height);
    }

    public static function fromPoints(x1:Float, y1:Float, x2:Float, y2:Float):Rectangle
    {
        return new Rectangle(x1, x2, x2 - x1, y2 - y1);
    }

    public static function checkForCollision(rect1:Rectangle, rect2:Rectangle):Bool
    {
        return (rect1.left < rect2.right && rect1.right > rect2.left &&
            rect1.top < rect2.bottom && rect1.bottom > rect2.top);
    }
}