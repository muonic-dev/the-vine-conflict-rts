extends Node

enum Mode { OFF, RECORD, PLAY }

@export var mode: Mode = Mode.OFF
@export var replay := {
	"meta": {},
	"commands": []
}

func start_recording(map_name: String, _seed: int, settings):
	mode = Mode.RECORD
	replay.meta = {
		"map": map_name,
		"seed": _seed,
		"settings": settings,
	}
	replay.commands.clear()

## Example command
## {
##     "tick": 120,
##     "player": 0,
##     "type": "move",
##     "units": [1, 3, 7],
##     "target": Vector3(10, 0, 25)
## }
func record_command(cmd: Dictionary):
	if mode != Mode.RECORD:
		return
	replay.commands.append(cmd.duplicate())

func stop_recording():
	mode = Mode.OFF

func save_to_file(path: String):
	var file := FileAccess.open(path, FileAccess.WRITE)
	file.store_string(JSON.stringify(replay))
	file.close()

func load_from_file(path: String):
	var file := FileAccess.open(path, FileAccess.READ)
	replay = JSON.parse_string(file.get_as_text())
	file.close()

func start_replay():
	mode = Mode.PLAY
