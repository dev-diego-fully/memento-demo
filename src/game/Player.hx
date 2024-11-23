package game;

import love.Love;
import love.graphics.GraphicsModule;
import love.graphics.DrawMode;
import love.keyboard.KeyboardModule;
import mementos.Snapshotable;

class Player extends TimeActor implements IDrawable implements IMoveable {
	// constructor
	public function new(x:Int, y:Int, speed:Int) {
		this.speed = speed;
		super(x, y);
	}

	// attributes
	private final speed:Float;

	// methods
	private function moveUp(dt:Float) {
		this.y -= this.speed * dt;
	}

	private function moveDown(dt:Float) {
		this.y += this.speed * dt;
	}

	private function moveLeft(dt:Float) {
		this.x -= this.speed * dt;
	}

	private function moveRight(dt:Float) {
		this.x += this.speed * dt;
	}

	public function draw():Void {
		GraphicsModule.setColor(0.2, 0.2, 1, 1);
		GraphicsModule.rectangle(DrawMode.Fill, this.x, this.y, 10, 10);
	}

	public function move(dt:Float):Void {
		if (KeyboardModule.isDown('w')) {
			this.moveUp(dt);
		}
		if (KeyboardModule.isDown('s')) {
			this.moveDown(dt);
		}
		if (KeyboardModule.isDown('a')) {
			this.moveLeft(dt);
		}
		if (KeyboardModule.isDown('d')) {
			this.moveRight(dt);
		}
	}
}
