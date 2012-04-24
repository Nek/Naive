package com.nikdudnik.naive.core;
using Reflect;
using Lambda;
/**
 * ...
 * @author nek
 */
class ComponentUtils {

	private static var cache:Hash<Dynamic>;
	
	public static function typeEq(enumConstructor:Dynamic, enumValue:Component):Bool {		
		if (cache == null) cache = new Hash<Dynamic>();
		var constructor = Type.enumConstructor(enumValue);
		var f = cache.get(constructor);
		if (f == null) {
				f = Component.field(Type.enumConstructor(enumValue));
				cache.set(constructor, f);
			};
		return f == enumConstructor;
	}
	
	public static function valueEq(c1:Component, c2:Component):Bool {
		return Type.enumEq(c1, c2);
	}
	
	public static function create(comps:Array<Component>):Ent {
		var e = new Ent();


		comps.iter(function(c:Component) {
			e.set(c);
		});
		
		
		return e;
	}
	
}