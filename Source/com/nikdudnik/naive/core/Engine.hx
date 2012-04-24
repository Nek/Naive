package com.nikdudnik.naive.core;

import nme.display.Sprite;
import nme.display.FPS;
import nme.filters.GlowFilter;
import nme.text.TextField;
import nme.Lib;		
import nme.events.Event;


import com.nikdudnik.naive.core.Component;
import com.nikdudnik.naive.core.Query;

using Lambda;
using Type;
using Reflect;
using com.nikdudnik.naive.core.Query;
using com.nikdudnik.naive.core.Utils;

typedef World = List<Ent>;

/**
 * @author nek
 */
	
class Engine {

	public var world:World;
	public var time:Int;
	public var elapsed:Float;
	
	
	public function new () {
				
		
		time = Lib.getTimer();
		world = new World();
		
		setup();
		
		Lib.current.addEventListener(Event.ENTER_FRAME, gameLoop);
	}

	private function gameLoop(e:Dynamic):Void {
		loop();
	}
	
	private function loop():Void {
		var newTime = Lib.getTimer();
        elapsed = (newTime - time)/1000;
        time = newTime;
	}
	
	private function setup():Void {
	}
}