@abstract class_name BasicKeyPad extends GridContainer

const SOUND_KEY = preload("uid://efvn2xxhdkox")
const PLACEHOLDER_KEY = preload("uid://xoeu42eee7ah")
const COLUMN_SEPARATOR = preload("uid://dky447s4ugvjc")

signal typed(sound : String)

func fill(grid):
	self.columns = grid[0].size() * 3 - 1;

	for row : Array in grid:
		var first = true;
		for pair : Array in row:
			if first:
				first = false
			else:
				self.add_child(COLUMN_SEPARATOR.instantiate())
			var sound_0 = pair[0]
			var sound_1 = pair[1]
			if sound_0:
				var key = SOUND_KEY.instantiate();
				key.pressed.connect(typed.emit.bind(sound_0.get_ipa_symbol()))
				self.add_child(key)
				key.set_sound(sound_0) 
			else:
				var key = PLACEHOLDER_KEY.instantiate();
				self.add_child(key)
			if sound_1:
				var key = SOUND_KEY.instantiate();
				key.pressed.connect(typed.emit.bind(sound_1.get_ipa_symbol()))
				self.add_child(key)
				key.set_sound(sound_1) 
			else:
				var key = PLACEHOLDER_KEY.instantiate();
				self.add_child(key)


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


func sound(sound_string : String) -> Sound:
	return Sound.new(sound_string)
