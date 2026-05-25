extends BasicKeyPad

func _ready() -> void:
	var vowels = [
		[
			[sound("i"), sound("y")],
			[sound("ɪ"), sound("ʏ")],
			[sound("ɨ"), sound("ʉ")],
			[sound("ʊ"), null], 
			[sound("ɯ"), sound("u")],
		], 
		[
			[sound("e"), sound("ø")],
			[null, null],
			[sound("ɘ"), sound("ɵ")],
			[null, null],
			[sound("ɤ"),
			sound("o")]],
		[
			[sound("e̞"), sound("ø̞")],
			[null, null],
			[sound("ə"), null],
			[null, null],
			[sound("o̞"), sound("ɤ̞")],
		],
		[
			[sound("ɛ"), sound("œ")],
			[null, null],
			[sound("ɜ"), sound("ɞ")],
			[null, null],
			[sound("ʌ"), sound("ɔ")],
		],
		[
			[sound("æ"), null],
			[null, null],
			[sound("ɐ"), null],
			[null, null],
			[null, null],
		],
		[
			[sound("a"), sound("ɶ")],
			[null, null],
			[sound("ä"), null],
			[null, null],
			[sound("ɑ"), sound("ɒ")],
		],
	]
	
	fill(vowels)
