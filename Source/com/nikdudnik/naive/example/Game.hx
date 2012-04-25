package com.nikdudnik.naive.example;

import com.nikdudnik.naive.systems.Render;
import nme.text.TextField;
import nme.display.FPS;
import nme.Lib;
import nme.display.Sprite;
import nme.installer.Assets;

using com.nikdudnik.naive.example.Utils;
using com.nikdudnik.naive.core.Query;
using Lambda;


import com.nikdudnik.naive.core.Engine;
import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.Component;

using com.nikdudnik.naive.systems.Render;
using com.nikdudnik.naive.systems.Collider;
using com.nikdudnik.naive.systems.ArrowKeysController;
using com.nikdudnik.naive.systems.MouseInput;
using com.nikdudnik.naive.systems.GroupFollower;
using com.nikdudnik.naive.systems.Mover;
using com.nikdudnik.naive.systems.PositionLimiter;
using com.nikdudnik.naive.systems.Generator;
import nme.geom.Point;
import nme.geom.Rectangle;

/**
 * ...
 * @author nek
 */
class Game extends Engine {

	private var tf:TextField;

    public static var counter:Int = 0;
	
	override private function setup():Void {
	
		tf = new TextField();
		tf.text = "Trace HUD";
		Lib.current.addChild(tf);
		
		var fps = new FPS();
		Lib.current.addChild(fps);
		fps.y = 20;
		
		world.createAddPlayer();
				
		world.createAddGenerator(function():Ent {
			var f = Math.random();
			var u = createUFO();
            u.set(follow(player));
			return u;
		});

        world.create([mouseinput, group(mouse)]);

		setupRender(Assets.getBitmapData("assets/characters.png"), [
            {
                position: new Rectangle(0,0,16,16),
                center: new Point(8, 8)
            },
            {
                position: new Rectangle(16*1,0,16,16),
                center: new Point(8, 8)
            },
            {
                position: new Rectangle(16*2,0,16,16),
                center: new Point(8, 8)
            }
        ]);
		setupArrowKeysController();
		setupPositionLimiter(700);
		setupMouseFollower();
	}


	
	override private function loop():Void {
		super.loop();

		generateEnemy();
		processMouseInput();
		followGroup(mouse);
		followGroup(player);
		move();
		collide(ufo, player);
		react();	
		remove();	
		draw(Lib.current);
		
	}

}
