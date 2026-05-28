class_name ModifierPad extends Control

signal typed(sound : IPA_Sound)

@onready var _keys: GridContainer = %Keys

const MODIFIER_KEY = preload("uid://dx7j1g7c5cv1i")


var _modifier_select = false;


func _emit_typed(sound : IPA_Sound):
	if not _modifier_select:
		typed.emit(sound)


func _apply_if(button : Button, sound  : IPA_Sound) -> IPA_Sound:
	if button.button_pressed:
		button.button_pressed = false;
		return sound.with_modifier(button.modifier);
	else:
		return sound


func _ready() -> void:
	var modifiers = [
		[IPA.MODIFIER_AFFRICATIVE, "ipa_modifier_affricative"],
		[IPA.MODIFIER_ASPIRATED, "ipa_modifier_aspirated"],
		[IPA.MODIFIER_RHOTIC_HOOK, "ipa_modifier_rhotic_hook"],
		[IPA.MODIFIER_RHOTIC_SUPERSCRIPT, "ipa_modifier_rhotic_superscript"],
		[IPA.MODIFIER_EJECTIVE, "ipa_modifier_ejective"],
		[IPA.MODIFIER_LABIALIZED, "ipa_modifier_labialized"],
		[IPA.MODIFIER_PALATALIZED, "ipa_modifier_palatalized"],
		[IPA.MODIFIER_VELARIZED, "ipa_modifier_velarized"],
		[IPA.MODIFIER_PHARYNGEALIZED, "ipa_modifier_pharyngealized"],
		[IPA.MODIFIER_GLOTTALIZED, "ipa_modifier_glottalized"],
		[IPA.MODIFIER_DIPHTHONG, "ipa_modifier_diphthong"],
		[IPA.MODIFIER_LONG_VOWEL, "ipa_modifier_long_vowel"],
		[IPA.MODIFIER_HALF_LONG_VOWEL, "ipa_modifier_half_long_vowel"],
		[IPA.MODIFIER_EXTRA_SHORT_VOWEL, "ipa_modifier_extra_short_vowel"],
	]
	
	_keys.columns = modifiers.size()
	
	for elem in modifiers:
		var modifier = elem[0]
		var action = elem[1]
		var button = MODIFIER_KEY.instantiate()
		_keys.add_child(button)
		button.set_modifier(modifier)
		button.set_input_action(action)

func apply(sound : IPA_Sound) -> void:
	if not _modifier_select:
		for key in _keys.get_children():
			sound = _apply_if(key, sound)
		_emit_typed(sound)


func _process(_delta: float) -> void:
	_modifier_select = Input.is_action_pressed("toggle_modifer_select") 
	for key in _keys.get_children():
		key.modifier_select = _modifier_select
