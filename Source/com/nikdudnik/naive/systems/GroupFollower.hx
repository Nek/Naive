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
class GroupFollower {

	
	public static function followGroup(g:Engine, tag:Tag) {

		var trg = g.world.exactly(group(tag));

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

        var lst = g.world.exactly(follow(tag));
                lst = lst.query([sspeed, position]);

                for (e in lst) {
                    var pos = e.get(position);
                    var sspeed = e.get(sspeed)[0];
                    var xd = cx - pos[0];
                    var yd = cy - pos[1];
                    var l = Math.sqrt(xd*xd + yd*yd);
                    if (sspeed > l) sspeed = l;
                    if ( xd != 0 ) xd = (xd / l) * sspeed;
                    if ( yd != 0 ) yd = (yd / l) * sspeed;
                    e.set(vspeed(xd, yd));
                }
	}

}