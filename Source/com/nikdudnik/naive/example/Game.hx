package com.nikdudnik.naive.example;

import com.nikdudnik.naive.core.Query;
import com.nikdudnik.naive.systems.Collider;
import com.nikdudnik.naive.systems.Collider;
import com.nikdudnik.naive.systems.Mover;
import com.nikdudnik.naive.systems.GroupFollower;
import com.nikdudnik.naive.systems.MouseInput;
import com.nikdudnik.naive.example.Utils;
import com.nikdudnik.naive.systems.Render;
import nme.text.TextField;
import nme.display.FPS;
import nme.Lib;
import nme.display.Sprite;
import nme.installer.Assets;

import com.nikdudnik.naive.example.Utils;
using com.nikdudnik.naive.core.Query;
using Lambda;


import com.nikdudnik.naive.core.GameLoop;
import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.Component;

import com.nikdudnik.naive.systems.Render;
import com.nikdudnik.naive.systems.Collider;
import com.nikdudnik.naive.systems.ArrowKeysController;
import com.nikdudnik.naive.systems.MouseInput;
import com.nikdudnik.naive.systems.GroupFollower;
import com.nikdudnik.naive.systems.GroupAttacker;
import com.nikdudnik.naive.systems.Mover;
import com.nikdudnik.naive.systems.WorldBounds;
import com.nikdudnik.naive.systems.Generator;
import com.nikdudnik.naive.systems.Cleaner;
import nme.geom.Point;
import nme.geom.Rectangle;

/**
 * ...
 * @author nek
 */
class Game {

	private var tf:TextField;

    public function new() {
        var world = new World();
        Utils.createAddPlayer(world);

        Query.create(world, [Component.mouseinput, Component.group(Tag.mouse)]);

        var draw = Render.setup(Assets.getBitmapData("assets/characters.png"), [
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

        var killOutsideBounds = WorldBounds.setup(new Rectangle(-150, -150, 300 + 300, 400 + 300));

        var mainGameLoop = new GameLoop(world);

        mainGameLoop.add(Utils.createAddUFO);
        mainGameLoop.add(MouseInput.process);
        mainGameLoop.add(GroupFollower.follow(mouse));
        mainGameLoop.add(callback(GroupAttacker.attack, player));
        mainGameLoop.add(Mover.move);
        mainGameLoop.add(callback(callback(Collider.collide, ufo), player));
        mainGameLoop.add(Collider.react);
        mainGameLoop.add(Utils.makeDebris);
        mainGameLoop.add(killOutsideBounds);
        mainGameLoop.add(Cleaner.removeDead);
        mainGameLoop.add(callback(draw, Lib.current));


        tf = new TextField();
        tf.text = "Trace HUD";
        Lib.current.addChild(tf);

        var fps = new FPS();
        Lib.current.addChild(fps);
        fps.y = 20;
    }




}
