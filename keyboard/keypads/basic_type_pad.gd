@abstract class_name BasicKeyPad extends GridContainer

const KEY = preload("uid://efvn2xxhdkox")
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
				var key = KEY.instantiate();
				key.text = sound_0;
				key.pressed.connect(typed.emit.bind(sound_0))
				self.add_child(key)
			else:
				var key = KEY.instantiate();
				key.disabled = true;
				key.text = "—";
				self.add_child(key)
			if sound_1:
				var key = KEY.instantiate();
				key.text = sound_1;
				key.pressed.connect(typed.emit.bind(sound_1))
				self.add_child(key)
			else:
				var key = KEY.instantiate();
				key.disabled = true;
				key.text = "—";
				self.add_child(key)
