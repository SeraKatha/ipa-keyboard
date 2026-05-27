extends BasicKey

@onready var _keyboard_hint: Label = %KeyboardHint

func set_hint(action : String) -> void:
	var input_action = InputMap.action_get_events(action)[0]
	_keyboard_hint.text = "⇄%s" % input_event_with_modifiert_to_string(input_action)
