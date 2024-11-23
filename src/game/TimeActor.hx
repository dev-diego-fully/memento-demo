package game;

import mementos.Snapshotable;
import mementos.ISnapshot;

class TimeActor extends Snapshotable {
	// constructor
	public function new(x:Float, y:Float) {
		this.x = x;
		this.y = y;
		super();
	}

	// properties
	public override function get_state():ISnapshot {
		return TimeActorSnapshot.from(x, y);
	}

	public override function set_state(snapshot:ISnapshot):ISnapshot {
		if (snapshot != null) {
			var snap:TimeActorSnapshot = cast(snapshot, TimeActorSnapshot);
			this.x = snap.x;
			this.y = snap.y;
		}
		return snapshot;
	}

	// attributes
	public var x(default, null):Float;
	public var y(default, null):Float;

	// methods
	public function checkPoint() {
		this.save();
	}

	public function rollback() {
		this.restore();
	}
}
