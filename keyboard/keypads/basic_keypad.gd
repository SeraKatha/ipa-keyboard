@abstract class_name BasicKeyPad extends GridContainer

const SOUND_KEY = preload("uid://efvn2xxhdkox")
const PLACEHOLDER_KEY = preload("uid://xoeu42eee7ah")
const COLUMN_SEPARATOR = preload("uid://dky447s4ugvjc")

signal typed(sound : IPA_Sound)

func fill(grid):
	self.columns = grid[0].size() * 3 - 1;

	for row : Array in grid:
		var first = true;
		for pair in row:
			if first:
				first = false
			else:
				self.add_child(COLUMN_SEPARATOR.instantiate())
			if pair == null:
				_add_place_holder()
				_add_place_holder()
			else:
				if pair[0]:
					_add_sound_button(pair[0])
				else:
					_add_place_holder()
				if pair[1]:
					_add_sound_button(pair[1])
				else:
					_add_place_holder()


func _add_sound_button(sound_action):
	var zound : IPA_Sound = null
	var action : String = ""
	if sound_action is Array and sound_action.size() == 2:
		zound = sound_action[0]
		action = sound_action[1]
	if sound_action is IPA_Sound:
		zound = sound_action
		action = "ipa_%s" % zound.get_sound_name()
	var key = SOUND_KEY.instantiate();
	key.pressed.connect(typed.emit.bind(zound))
	self.add_child(key)
	key.set_sound(zound)
	key.set_input_action(action)


func _add_place_holder():
	var key = PLACEHOLDER_KEY.instantiate();
	self.add_child(key)


func sound(sound_string : String) -> IPA_Sound:
	return IPA_Sound.from_string(sound_string)
