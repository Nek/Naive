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

	public static function processMouseInput(g:Engine) {
		var lst = g.world.query([mouseinput]);

        for (e in lst) {
            e.set(position(Lib.current.stage.mouseX, Lib.current.stage.mouseY));
        }
	}	

}