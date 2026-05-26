extends Button

@onready var _keyboard_hint: Label = %KeyboardHint

func set_hint(action : String) -> void:
	var input_action = InputMap.action_get_events(action)[0]
	var hint = "⇄%s" % OS.get_keycode_string(input_action.keycode).to_lower()
	_keyboard_hint.text = hint
