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





func sound(sound_string : String) -> IPA.Sound:
	return IPA.Sound.new(sound_string)
