extends BasicKey

@onready var _keyboard_hint: Label = %KeyboardHint
var _action : String;
var modifier_select = false;
var modifier : IPA.Modifier

func set_modifier(mod : IPA.Modifier) -> void:
	modifier = mod
	text = mod.get_ipa_symbol() % "◌"
	_action = mod.get_input_action()
	_keyboard_hint.text = _generate_keyboard_hint(mod)


func _generate_keyboard_hint(mod : IPA.Modifier) -> String:
	var primary_input_action := mod.get_primary_event()
	if primary_input_action:
		return "⇄%s" % input_event_with_modifiert_to_string(primary_input_action)
	else:
		return ""


func _input(event: InputEvent) -> void:
	if modifier_select and InputMap.has_action(_action) and event.is_action(_action, true) and event.is_pressed():
		button_pressed = !button_pressed
