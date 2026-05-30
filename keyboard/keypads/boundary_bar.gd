extends HBoxContainer

signal typed_sound(string : IPA_Sound)

const SOUND_KEY = preload("uid://efvn2xxhdkox")

func _ready() -> void:
	var boundaries = [
		IPA.BOUNDARY_MORPHEME,
		IPA.BOUNDARY_PHONOLOGICAL_WORD,
		IPA.BOUNDARY_SYLLABLE,
		IPA.BOUNDARY_WORD,
		IPA.STRESS_PRIMARY,
		IPA.STRESS_SECONDARY,
	]
	for boundary in boundaries:
		var key = SOUND_KEY.instantiate()
		add_child(key)
		key.set_sound(boundary)
		key.pressed.connect(_on_typed.bind(boundary))


func _on_typed(sound: IPA_Sound) -> void:
	typed_sound.emit(sound)
