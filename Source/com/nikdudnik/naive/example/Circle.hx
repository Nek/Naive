package com.nikdudnik.naive.example;
import nme.display.Sprite;

/**
 * ...
 * @author nek
 */
class Circle extends Sprite {
	
	public function new () {
		super();
	}		
	
	public function redraw(color:Int, radus:Float):Void {
		graphics.beginFill(color);
		graphics.drawCircle(0,0, 20);
		graphics.endFill();	
	}
}