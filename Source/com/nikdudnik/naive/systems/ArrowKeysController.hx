package com.nikdudnik.naive.systems;
import nme.events.KeyboardEvent;
import nme.Lib;
using com.nikdudnik.naive.core.Query;

import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.GameLoop;

import nme.ui.Keyboard;

import haxe.FastList;

import com.nikdudnik.naive.core.Component;

using Lambda;

/**
 * ...
 * @author nek
 */
class ArrowKeysController {

	private static var keys:FastList<Int>;


	public static function setupArrowKeysController(g:GameLoop):Void {
		ArrowKeysController.keys = new FastList<Int>();
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, ArrowKeysController.pressKey);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, ArrowKeysController.releaseKey);
	}
	
	private static function pressKey(e:KeyboardEvent):Void {
		keys.remove(e.keyCode);
		keys.add(e.keyCode);
	}
	
	private static function releaseKey(e:KeyboardEvent):Void {
		keys.remove(e.keyCode);
	}
	
	public static function processArrowKeys(g:GameLoop) {
		var lst = g.world.query([arrowkeys, sspeed]);
				
		var up:Bool = keys.remove(Keyboard.UP);
		if (up) keys.add(Keyboard.UP);
		var down:Bool = keys.remove(Keyboard.DOWN);
		if (down) keys.add(Keyboard.DOWN);
		var left:Bool = keys.remove(Keyboard.LEFT);
		if (left) keys.add(Keyboard.LEFT);
		var right:Bool = keys.remove(Keyboard.RIGHT);
		if (right) keys.add(Keyboard.RIGHT);
					
		var xd:Float = if (left && right) 0 else if (left && !right) -1 else if (!left && right) 1 else if (!left && !right) 0;
		var yd:Float = if (up && down) 0 else if (up && !down) -1 else if (!up && down) 1 else if (!up && !down) 0;
						
		var l = Math.sqrt(xd*xd + yd*yd);
			
		lst.iter(function(e:Ent) {
			var s = e.get(sspeed)[0];
			if ( xd != 0 ) xd = (xd / l) * s;
			if ( yd != 0 ) yd = (yd / l) * s;
			e.set(vspeed(xd, yd));
		});
	}	

}
