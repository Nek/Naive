package com.nikdudnik.naive.systems;
import nme.events.MouseEvent;
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
class GroupAttacker {

	
	public static function attack(tag:Tag, world:World) {


		var trg = world.exactly(group(tag));

        var count = 0;
        var cx = 0.0;
        var cy = 0.0;
        for (te in trg) {
            count ++;
            var pos = te.get(position);
            cx += pos[0];
            cy += pos[1];
        };

        cx /= count;
        cy /= count;


        var lst = world.exactly(Component.attack(tag));
        lst = lst.query([sspeed, position]);

        for (e in lst) {
            var pos = e.get(position);
            var sspeed = e.get(sspeed)[0]*(1/30);
            var xd = cx - pos[0];
            var yd = cy - pos[1];
            var l = Math.sqrt(xd*xd + yd*yd);

            e.set(vspeed((xd / l) * sspeed, (yd / l) * sspeed));
        }
	}	

}