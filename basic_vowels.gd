extends TypePad



func _ready() -> void:
	var vowels = [
		[["i", "y"],   ["ɪ", "ʏ"],    ["ɨ", "ʉ"],   ["ʊ", null],  ["ɯ", "u"]], 
		[["e", "ø"],   [null, null], ["ɘ", "ɵ"],   [null, null], ["ɤ", "o"]],
		[["e̞", "ø̞"],   [null, null], ["ə", null],  [null, null], ["o̞", "ɤ̞"]],
		[["ɛ", "œ"],   [null, null], ["ɜ", "ɞ"],   [null, null], ["ʌ", "ɔ"]],
		[["æ", null],  [null, null], ["ɐ", null],  [null, null], [null, null]],
		[["a", "ɶ"],   [null, null], ["ä", null], [null, null], ["ɑ", "ɒ"]],
	]
	
	fill(vowels)
