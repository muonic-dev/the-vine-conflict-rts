extends GridContainer

class_name GridHotkeys

const GRID_KEYS = [
	KEY_Q, KEY_W, KEY_E, KEY_R,
	KEY_A, KEY_S, KEY_D, KEY_F,
	KEY_Y, KEY_X, KEY_C, KEY_V
]

func _ready():
	_assign_grid_shortcuts()

func _assign_grid_shortcuts():
	var buttons := get_children().filter(func(n): return n is Button)

	for i in range(min(buttons.size(), GRID_KEYS.size())):
		var btn: Button = buttons[i]

		if btn.disabled:
			continue

		var sc := Shortcut.new()
		var ev := InputEventKey.new()
		ev.keycode = GRID_KEYS[i]
		sc.events = [ev]
		btn.shortcut = sc
