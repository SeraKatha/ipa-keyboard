extends FullTypePad

@onready var _diphthong_toggle: Button = %DiphthongToggle
@onready var _long_vowel: Button = %LongVowel
@onready var _half_long_vowel: Button = %HalfLongVowel
@onready var _extra_short_vowel: Button = %ExtraShortVowel

signal typed(sound : String)


func _on_basic_vowels_typed(sound: String) -> void:
	sound = _apply_if(_diphthong_toggle, sound, "%s\u032F")
	sound = _apply_if(_long_vowel, sound, "%s\u02D0")
	sound = _apply_if(_half_long_vowel, sound, "%s\u02D1")
	sound = _apply_if(_extra_short_vowel, sound, "%s\u0306")
	typed.emit(sound);
