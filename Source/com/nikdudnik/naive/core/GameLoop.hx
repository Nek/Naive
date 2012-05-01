package com.nikdudnik.naive.core;

import nme.display.Sprite;
import nme.display.FPS;
import nme.text.TextField;
import nme.Lib;		
import nme.events.Event;

import com.nikdudnik.naive.core.Component;
import com.nikdudnik.naive.core.Query;

import haxe.FastList;


using Lambda;
using Type;
using Reflect;
using com.nikdudnik.naive.core.Query;

typedef World = FastList<Ent>;

/**
 * @author nek
 */
	
class GameLoop {

	public var world:World;
	public var time:Int;
	public var elapsed:Float;
    private var accumulator:Float;

    private var steps:Array<World->Void>;
	
	
	public function new (w:World) {

        steps = [];

        world = w;


        accumulator = 0;
		
		time = Lib.getTimer();

		Lib.current.addEventListener(Event.ENTER_FRAME, gameLoop);
	}

	private function gameLoop(e:Dynamic):Void {
        var newTime = Lib.getTimer();
        elapsed = (newTime - time)/1000;
        time = newTime;

        accumulator += elapsed;
        if (accumulator > 1/30) {
            for (step in steps) {
                step(world);
            }
            accumulator -= 1/30;
        }
	}

    public function add(step:World->Void) {
        steps.push(step);
    }
}