package com.nikdudnik.naive.core;

import Type;
using com.nikdudnik.naive.core.Component;
import Lambda;
using Lambda;
using Reflect;
import com.nikdudnik.naive.core.ComponentUtils;

import haxe.FastList;

/**
 * ...
 * @author nek
 */
class Ent {

	private var comps:FastList<Component>;
	
	public function new () {
		comps = new FastList<Component>();
	}	
	
	public function set(c:Component):Ent {
		comps.add( c);
		return this;
	}
	
	public function get(enumConstructor:Dynamic):Array<Dynamic> {
		var c = comps.filter(function(el:Component):Bool{
			return ComponentUtils.typeEq(enumConstructor, el);
		}).first();
		if (c == null) return null;
		return Type.enumParameters(c);
	}	
	
	public function del(enumConstructor:Dynamic):Bool {
		var c = comps.filter(function(el:Component):Bool{
			return ComponentUtils.typeEq(enumConstructor, el);
		}).first();
		if (c == null) return false;
		return comps.remove( c );
	}
	
	public function has(enumConstructor:Dynamic):Bool {
		return Lambda.exists(comps, callback(ComponentUtils.typeEq, enumConstructor));
	}
	
	public function exactly(en:Component):Bool {
		return Lambda.exists(comps, callback(ComponentUtils.valueEq, en));
	}

}
