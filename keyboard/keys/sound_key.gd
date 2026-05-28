extends BasicKey

@onready var _keyboard_hint: Label = %KeyboardHint
var _action : String;


func set_sound(sound : IPA_Sound) -> void:
	text = sound.get_ipa_symbol()


func set_input_action(input_action_name : String) -> void:
	_keyboard_hint.text = _generate_keyboard_hint(input_action_name)
	_action = input_action_name


func _generate_keyboard_hint(input_action_name : String) -> String:
	var primary_input_action := get_primary_event(input_action_name)
	if primary_input_action:
		return input_event_with_modifiert_to_string(primary_input_action)
	else:
		return ""


func _input(event: InputEvent) -> void:
	if InputMap.has_action(_action):
		if event.is_action(_action, true) and event.is_pressed():
			pressed.emit()
