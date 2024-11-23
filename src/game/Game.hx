package game;

import love.Love;
import love.graphics.GraphicsModule;
import love.graphics.DrawMode;
import love.keyboard.KeyboardModule;
import lua.Table;

class Game {
	public function new() {}

	private var player:Player;
	private var enemies:Array<Enemy>;

	private function draw() {
		for (e in this.enemies) {
			e.draw();
		}
		this.player.draw();
	}

	private function load(load:Table<Dynamic, Dynamic>) {
		GraphicsModule.setBackgroundColor(0.1, 0.1, 0.1, 1);
		this.player = new Player(30, 30, 250);
		this.enemies = new Array<Enemy>();
		for (i in 0...25) {
			this.enemies.push(new Enemy(0, 0));
			this.enemies[i].init();
		}
	}

	private function update(dt:Float) {
		if (KeyboardModule.isDown('p')) {
			this.rollback();
		} else {
			this.checkPoint();
			this.move(dt);
		}
	}

	private function move(dt) {
		this.player.move(dt);
		for (e in this.enemies) {
			e.move(dt);
		}
	}

	private function checkPoint() {
		this.player.checkPoint();
		for (e in this.enemies) {
			e.checkPoint();
		}
	}

	private function rollback() {
		this.player.rollback();
		for (e in this.enemies) {
			e.rollback();
		}
	}

	public static function main() {
		var game = new Game();
		Love.update = game.update;
		Love.load = game.load;
		Love.draw = game.draw;
	}
}
