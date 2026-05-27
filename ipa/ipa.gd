class_name IPA extends Node

class Sound:
	var _sound : String
	var _name : String
	func _init(sound_string : String) -> void:
		_sound = sound_string
		_name = sound_string
	func overide_name(name_string : String):
		_name = name_string
		return self
	func get_ipa_symbol() -> String:
		return _sound
	func get_action_name():
		return "ipa_%s" % _name;
	func get_primary_event() -> InputEvent:
		var input_actions = InputMap.action_get_events(get_action_name())
		if input_actions.is_empty():
			return null
		else:
			return input_actions[0]
