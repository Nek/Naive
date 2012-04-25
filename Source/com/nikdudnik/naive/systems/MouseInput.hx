package com.nikdudnik.naive.systems;
import nme.events.MouseEvent;
import nme.Lib;
using com.nikdudnik.naive.core.Query;

import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.Engine;

import nme.ui.Keyboard;

import haxe.FastList;

import com.nikdudnik.naive.core.Component;

using Lambda;

/**
 * ...
 * @author nek
 */
class MouseInput {

	private static var mouseX:Float;
	private static var mouseY:Float;

    private static var hasNewData:Bool = false;


	public static function setupMouseFollower(g:Engine):Void {
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_MOVE, MouseInput.mouseMoved);
	}

	private static function mouseMoved(e:MouseEvent):Void {
        mouseX = Lib.current.stage.mouseX;
        mouseY = Lib.current.stage.mouseY;
	}

	public static function processMouseInput(g:Engine) {
		var lst = g.world.query([mouseinput]);

		lst.iter(function(e:Ent) {
            e.set(position(mouseX, mouseY));
		});
	}	

}