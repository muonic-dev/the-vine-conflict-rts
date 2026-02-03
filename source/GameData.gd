extends Node

var data: Dictionary = {}

func load_data():
	var file_path = "res://data/stats.json"
	if FileAccess.file_exists(file_path):
		var json_text = FileAccess.get_file_as_string(file_path)
		var parse_result = JSON.parse_string(json_text)
		if typeof(parse_result) == TYPE_DICTIONARY:
			data = parse_result
		else:
			print("Error parsing JSON")
	else:
		print("JSON file not found")

func get_unit_stats(unit_id: String) -> Dictionary:
	return data.units.get(unit_id, {})
