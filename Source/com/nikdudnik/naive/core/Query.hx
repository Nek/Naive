package com.nikdudnik.naive.core;

using Lambda;
import haxe.FastList;

import com.nikdudnik.naive.core.Component;

/**
 * ...
 * @author nek
 */
class Query {
	
	public static function query( l:FastList<Ent>, types: Array<Dynamic>):FastList<Ent>
	{
        var filtered = new FastList<Ent>();
        for (e in l) {
            var fits = true;
            for (t in types) {
                fits = fits && e.has(t);
            }
            if (fits) filtered.add(e);
        }

        return filtered;
	}		
	
	public static function exactly(l:FastList<Ent>, c:Component):FastList<Ent> {

        var filtered = new FastList<Ent>();
        for (e in l) {
            if (e.exactly(c)) filtered.add(e);
        }

        return filtered;

//		return l.filter(function(e:Ent):Bool {
//			return e.exactly(c);
//		});
	}
	
	public static function create(l:FastList<Ent>, comps:Array<Component>):Ent {
		var e = Ent.create(comps);
		
		l.add(e);
		
		return e;
	}

}
