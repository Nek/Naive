package com.nikdudnik.naive.core;

using Lambda;

/**
 * ...
 * @author nek
 */
class Query {
	
	public static function query( l:List<Ent>, types: Array<Dynamic>):List<Ent> 
	{
		return l.filter(function(e:Ent) {
				return types.map(function(c:Dynamic):Bool {
					return e.has(c);
				}).fold(function(a:Bool, b:Bool):Bool {
					return a && b;
				}, true);
			});
	}		
	
	public static function exactly(l:List<Ent>, c:Component):List<Ent> {
		
		return l.filter(function(e:Ent):Bool {
			return e.exactly(c);
		});
	}
	
	public static function create(l:List<Ent>, comps:Array<Component>):Ent {
		var e = ComponentUtils.create(comps);
		
		l.add(e);
		
		return e;
	}

}
