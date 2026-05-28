extends HBoxContainer

signal typed_sound(string : IPA_Sound)

const SOUND_KEY = preload("uid://efvn2xxhdkox")

func _ready() -> void:
	var boundaries = [
		[IPA_Sound.from_string("."), "ipa_boundary_syllable"],
		[IPA_Sound.from_string("#"), "ipa_boundary_word"],
		[IPA_Sound.from_string("$"), "ipa_boundary_phonological_word"],
		[IPA_Sound.from_string("+"), "ipa_boundary_morpheme"],
		[IPA_Sound.from_string("+"), "ipa_boundary_morpheme"],
		[IPA_Sound.from_string("\u02C8"), "ipa_stress_primary"],
		[IPA_Sound.from_string("\u02CC"), "ipa_stress_secondary"],
	]
	for boundary in boundaries:
		var key = SOUND_KEY.instantiate()
		var sound = boundary[0]
		var input_action = boundary[1]
		add_child(key)
		key.set_sound(sound)
		key.set_input_action(input_action)
		key.pressed.connect(_on_typed.bind(sound))


func _on_typed(sound: IPA_Sound) -> void:
	typed_sound.emit(sound)
