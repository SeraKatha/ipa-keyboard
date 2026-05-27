extends HBoxContainer

signal typed_sound(string : IPA.Sound)

const SOUND_KEY = preload("uid://efvn2xxhdkox")

func _ready() -> void:
	var boundaries = [
		[IPA.Sound.new("."), "ipa_boundary_syllable"],
		[IPA.Sound.new("#"), "ipa_boundary_word"],
		[IPA.Sound.new("$"), "ipa_boundary_phonological_word"],
		[IPA.Sound.new("+"), "ipa_boundary_morpheme"],
	]
	for boundary in boundaries:
		var key = SOUND_KEY.instantiate()
		var sound = boundary[0]
		var input_action = boundary[1]
		add_child(key)
		key.set_sound(sound)
		key.set_input_action(input_action)
		key.pressed.connect(_on_typed.bind(sound))


func _on_typed(sound: IPA.Sound) -> void:
	typed_sound.emit(sound)
