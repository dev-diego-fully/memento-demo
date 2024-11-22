package game;

import Random;
import love.Love;
import love.graphics.GraphicsModule;
import love.graphics.DrawMode;
import love.keyboard.KeyboardModule;
import mementos.Snapshotable;

class Enemy extends TimeActor implements IDrawable {
	public function new(x:Int, y:Int) {
		super(x, y);
	}

	private final speed:Float = 300;

	public function draw():Void {
		GraphicsModule.setColor(1, 0.2, 0.2, 1);
		GraphicsModule.rectangle(DrawMode.Fill, this.x, this.y, 10, 10);
	}

	public function init():Void {
		this.x = 200;
		this.y = 200;
	}

	public function move(dt:Float):Void {
		this.x += Random.float(-1, 1) * this.speed * dt;
		this.y += Random.float(-1, 1) * this.speed * dt;
	}
}
