extends HBoxContainer

signal typed_sound(string : String)

const SOUND_KEY = preload("uid://efvn2xxhdkox")

func _ready() -> void:
	var boundaries = [
		IPA.Sound.new(".").input_action("ipa_boundary_syllable"),
		IPA.Sound.new("#").input_action("ipa_boundary_word"),
		IPA.Sound.new("$").input_action("ipa_boundary_phonological_word"),
		IPA.Sound.new("+").input_action("ipa_boundary_morpheme"),
	]
	for boundary in boundaries:
		var key = SOUND_KEY.instantiate()
		add_child(key)
		key.set_sound(boundary)
		key.pressed.connect(_on_typed.bind(boundary.get_ipa_symbol()))


func _on_typed(sound: String) -> void:
	typed_sound.emit(sound)
