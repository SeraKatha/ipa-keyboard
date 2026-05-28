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
		[IPA_Modifier.new("%s\u0361"), "ipa_modifier_affricative"],
		[IPA_Modifier.new("%s\u02B0"), "ipa_modifier_aspirated"],
		[IPA_Modifier.new("%s\u02DE"), "ipa_modifier_rhotic_hook"],
		[IPA_Modifier.new("%s\u02B4"), "ipa_modifier_rhotic_superscript"],
		[IPA_Modifier.new("%s\u02BC"), "ipa_modifier_ejective"],
		[IPA_Modifier.new("%s\u02B7"), "ipa_modifier_labialized"],
		[IPA_Modifier.new("%s\u02B2"), "ipa_modifier_palatalized"],
		[IPA_Modifier.new("%s\u02E0"), "ipa_modifier_velarized"],
		[IPA_Modifier.new("%s\u02E4"), "ipa_modifier_pharyngealized"],
		[IPA_Modifier.new("%s\u02C0"), "ipa_modifier_glottalized"],
		[IPA_Modifier.new("%s\u032F"), "ipa_modifier_diphthong"],
		[IPA_Modifier.new("%s\u02D0"), "ipa_modifier_long_vowel"],
		[IPA_Modifier.new("%s\u02D1"), "ipa_modifier_half_long_vowel"],
		[IPA_Modifier.new("%s\u0306"), "ipa_modifier_extra_short_vowel"],
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
