extends BasicKey

@export var modifier : IPA_Modifier

@onready var _keyboard_hint: Label = %KeyboardHint
var _action : String;
var modifier_select = false;

func set_modifier(mod : IPA_Modifier) -> void:
	modifier = mod
	text = mod.get_ipa_symbol() % "◌"
	var input_action_name = "ipa_%s" % modifier.get_sound_name()
	_keyboard_hint.text = _generate_keyboard_hint(input_action_name)
	_action = input_action_name
	

func _generate_keyboard_hint(input_action_name : String) -> String:
	var primary_input_action := get_primary_event(input_action_name)
	if primary_input_action:
		return "⇄%s" % input_event_with_modifiert_to_string(primary_input_action)
	else:
		return ""


func _input(event: InputEvent) -> void:
	if modifier_select and InputMap.has_action(_action) and event.is_action(_action, true) and event.is_pressed():
		button_pressed = !button_pressed
