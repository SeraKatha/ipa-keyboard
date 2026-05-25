extends BasicKeyPad

func _ready() -> void:
	var plosives = [
		["p", "b"],
		[null, null],
		[null, null],
		["t", "d"],
		[null, null],
		["ʈ", "ɖ"],
		["c", "ɟ"],
		["k", "g"],
		["q", "ɢ"],
		[null, null],
		["ʔ", null],
	]
	
	var nasals = [
		[null, "m"],
		[null, "ɱ"],
		[null, null],
		[null, null],
		[null, "n"],
		[null, "ɳ"],
		[null, "ɲ"],
		[null, "ŋ"],
		[null, "ɴ"],
		[null, null],
		[null, null],
	]
	
	var trills = [
		[null, "ʙ"],
		[null, null],
		[null, null],
		[null, "r"],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, "ʀ"],
		[null, null],
		[null, null],
	]
	
	var taps = [
		[null, null],
		[null, "ⱱ"],
		[null, null],
		[null, "ɾ"],
		[null, null],
		[null, "ɽ"],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var fricatives = [
		["ɸ", "β"],
		["f", "v"],
		["θ", "ð"],
		["s", "z"],
		["ʃ", "ʒ"],
		["ʂ", "ʐ"],
		["ç", "ʝ"],
		["x", "ɣ"],
		["χ", "ʁ"],
		["ħ", "ʕ"],
		["h", "ɦ"],
	]
	
	var lateral_fricatives = [
		[null, null],
		[null, null],
		[null, null],
		["ɬ", "ɮ"],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var approximants = [
		[null, null],
		[null, "ʋ"],
		[null, null],
		[null, "ɹ"],
		[null, null],
		[null, "ɻ"],
		[null, "j"],
		[null, "ɰ"],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var lateral_approximants = [
		[null, null],
		[null, null],
		[null, null],
		[null, "l"],
		[null, null],
		[null, "ɭ"],
		[null, "ʎ"],
		[null, "ʟ"],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var consonants = [
		plosives,
		nasals,
		trills,
		taps,
		fricatives,
		lateral_fricatives,
		approximants,
		lateral_approximants,
	]
	
	fill(consonants)
