package game;

import mementos.*;
import haxe.ds.ObjectMap;

class TimeActorSnapshot extends Snapshot {
	private static final pres:ObjectMap<Float, ObjectMap<Float, TimeActorSnapshot>> = new ObjectMap<Float, ObjectMap<Float, TimeActorSnapshot>>();

	private static function get_snap(x:Float, y:Float):TimeActorSnapshot {
		if (TimeActorSnapshot.pres.get(x) == null) {
			return TimeActorSnapshot.add_snap(x, y);
		} else if (TimeActorSnapshot.pres.get(x).get(y) == null) {
			return TimeActorSnapshot.add_snap(x, y);
		} else {
			return TimeActorSnapshot.pres.get(x).get(y);
		}
	}

	private static function add_snap(x:Float, y:Float):TimeActorSnapshot {
		if (TimeActorSnapshot.pres.get(x) == null) {
			TimeActorSnapshot.pres.set(x, new ObjectMap<Float, TimeActorSnapshot>());
		}
		var snap:TimeActorSnapshot = new TimeActorSnapshot(x, y);
		TimeActorSnapshot.pres.get(x).set(y, snap);
		return snap;
	}

	public static function from(x:Float, y:Float):TimeActorSnapshot {
		return TimeActorSnapshot.add_snap(x, y);
	}

	// constructor
	private function new(x:Float, y:Float) {
		this.x = x;
		this.y = y;
	}

	// attributes
	public final x:Float;
	public final y:Float;
}
