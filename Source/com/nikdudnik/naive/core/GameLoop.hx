package com.nikdudnik.naive.core;

import nme.events.TimerEvent;
import nme.utils.Timer;
import nme.events.TimerEvent;
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

    public static inline var FRAME_TIME:Float = 25.0; // 1000/40

    private var steps:Array<World->Void>;

    private var timeScale:Float;
	
	public function new (w:World) {

        getDiff = function() {
            return 0;
        };

        timeScale = 1;

        paused = false;

        steps = [];

        world = w;

        accumulator = 0;

		time = Lib.getTimer();

		Lib.current.addEventListener(Event.ENTER_FRAME, gameLoop);
	}

    public var paused:Bool;

    private function beginTimeCount():Void->Int {
        var curr = Lib.getTimer();
        return function() {
            return Lib.getTimer() - curr;
        };
    }

	private function gameLoop(e:Dynamic):Void {
        runSteps(world);
        render(world);
	}

    private function runSteps(world:World) {
        for (step in 0...steps.length) {
            steps[step](world);
        };
    }

    private var getDiff:Void->Int;

    public function add(step:World->Void) {
        steps.push(step);
    }

    public function addRender(step:World->Void) {
        render = step;
    }

    private var render:World->Void;
}