package mementos;

interface ISnapshotable {
	// attributes
	private var saver:ISnapshotManager;
	private var state(get, set):ISnapshot;

	// properties
	private function get_state():ISnapshot;
	private function set_state(snapshot:ISnapshot):ISnapshot;

	// methods
	public function save():Void;
	public function restore():Void;
}
