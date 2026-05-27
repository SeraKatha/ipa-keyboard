extends BasicKey

@onready var _keyboard_hint: Label = %KeyboardHint
var _action : String;


func set_sound(sound : IPA.Sound) -> void:
	text = sound.get_ipa_symbol()
	_action = sound.get_action_name()
	_keyboard_hint.text = _generate_keyboard_hint(sound)


func _generate_keyboard_hint(sound : IPA.Sound) -> String:
	var primary_input_action := sound.get_primary_event()
	if primary_input_action:
		return input_event_with_modifiert_to_string(primary_input_action)
	else:
		return ""


func _input(event: InputEvent) -> void:
	if InputMap.has_action(_action):
		if event.is_action(_action, true) and event.is_pressed():
			pressed.emit()
