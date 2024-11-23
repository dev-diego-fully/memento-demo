package mementos;

class Snapshotable {
	private function new() {
		this.saver = new SnapshotManager();
	}

	// attributes
	private var saver:ISnapshotManager;
	private var state(get, set):ISnapshot;

	// properties
	private function get_state():ISnapshot {
		throw "Not implemented";
	}

	private function set_state(state:ISnapshot):ISnapshot {
		throw "Not implemented";
	}

	// methods
	public function save() {
		this.saver.push(this.state);
	}

	public function restore() {
		this.state = this.saver.pop();
	}
}
