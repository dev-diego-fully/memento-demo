package mementos;

interface ISnapshotManager {
	// methods
	public function push(snapshot:ISnapshot):Void;
	public function pop():ISnapshot;
}
