extends Button

@onready var _keyboard_hint: Label = %KeyboardHint
var _action : String;


func set_sound(sound : BasicKeyPad.Sound) -> void:
	text = sound.get_ipa_symbol()
	_action = sound.get_action_name()
	_keyboard_hint.text = _generate_keyboard_hint(sound)


func _generate_keyboard_hint(sound : BasicKeyPad.Sound) -> String:
	var primary_input_action = sound.get_primary_event()
	if primary_input_action:
		var hint = OS.get_keycode_string(primary_input_action.keycode).to_lower()
		if primary_input_action.shift_pressed:
			hint = "⇧%s" % hint.to_upper()
		if primary_input_action.alt_pressed:
			hint = "⌥%s" % hint
		if primary_input_action.ctrl_pressed:
			hint = "⌃%s" % hint
		return hint
	else:
		return ""


func _input(event: InputEvent) -> void:
	if InputMap.has_action(_action):
		if event.is_action(_action, true) and event.is_pressed():
			pressed.emit()
