package mementos;

class SnapshotManager implements ISnapshotManager {
	public function new() {
		this.snapshots = new Array<ISnapshot>();
	}

	// attributes
	private final snapshots:Array<ISnapshot>;

	// methods
	public function push(snapshot:ISnapshot):Void {
		this.snapshots.push(snapshot);
	}

	public function pop():ISnapshot {
		return this.snapshots.pop();
	}
}
