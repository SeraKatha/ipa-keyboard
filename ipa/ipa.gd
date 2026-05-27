class_name IPA extends Node


class Item:
	var _symbol : String
	var _action : String
	func get_ipa_symbol() -> String:
		return _symbol
	func get_input_action():
		return _action;
	func get_primary_event() -> InputEvent:
		var input_actions = InputMap.action_get_events(get_input_action())
		if input_actions.is_empty():
			return null
		else:
			return input_actions[0]


class Sound extends Item:
	func _init(symbol : String) -> void:
		_symbol = symbol
	func input_action(action_name : String):
		_action = action_name
		return self
	func with_modifier(modifier : Modifier) -> IPA.Sound:
		return IPA.Sound.new(modifier.get_ipa_symbol() % self.get_ipa_symbol())


class Modifier extends Item:
	func _init(symbol : String) -> void:
		_symbol = symbol
	func input_action_tab_plus(action_name : String):
		_action = action_name
		return self
