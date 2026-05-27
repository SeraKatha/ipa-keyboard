class_name ModifierPad extends Control

signal typed(sound : IPA.Sound)


var _modifier_select = false;


func _emit_typed(sound : IPA.Sound):
	if not _modifier_select:
		typed.emit(sound)


func _apply_if(button : Button, sound  : IPA.Sound) -> IPA.Sound:
	if button.button_pressed:
		button.button_pressed = false;
		return sound.with_modifier(button.modifier);
	else:
		return sound



@onready var _keys: GridContainer = %Keys
const MODIFIER_KEY = preload("uid://dx7j1g7c5cv1i")

func _ready() -> void:
	var modifiers = [
		IPA.Modifier.new("%s\u0361").input_action_tab_plus("ipa_modifier_affricative"),
		IPA.Modifier.new("%s\u02B0").input_action_tab_plus("ipa_modifier_aspirated"),
		IPA.Modifier.new("%s\u02DE").input_action_tab_plus("ipa_modifier_rhotic_hook"),
		IPA.Modifier.new("%s\u02B4").input_action_tab_plus("ipa_modifier_rhotic_superscript"),
		IPA.Modifier.new("%s\u02BC").input_action_tab_plus("ipa_modifier_ejective"),
		IPA.Modifier.new("%s\u02B7").input_action_tab_plus("ipa_modifier_labialized"),
		IPA.Modifier.new("%s\u02B2").input_action_tab_plus("ipa_modifier_palatalized"),
		IPA.Modifier.new("%s\u02E0").input_action_tab_plus("ipa_modifier_velarized"),
		IPA.Modifier.new("%s\u02E4").input_action_tab_plus("ipa_modifier_pharyngealized"),
		IPA.Modifier.new("%s\u02C0").input_action_tab_plus("ipa_modifier_glottalized"),
		IPA.Modifier.new("%s\u032F").input_action_tab_plus("ipa_modifier_diphthong"),
		IPA.Modifier.new("%s\u02D0").input_action_tab_plus("ipa_modifier_long_vowel"),
		IPA.Modifier.new("%s\u02D1").input_action_tab_plus("ipa_modifier_half_long_vowel"),
		IPA.Modifier.new("%s\u0306").input_action_tab_plus("ipa_modifier_extra_short_vowel"),
	]
	
	for modifier in modifiers:
		var button = MODIFIER_KEY.instantiate()
		_keys.add_child(button)
		button.set_modifier(modifier);


func apply(sound : IPA.Sound) -> void:
	if not _modifier_select:
		for key in _keys.get_children():
			sound = _apply_if(key, sound)
		_emit_typed(sound)


func _process(_delta: float) -> void:
	_modifier_select = Input.is_action_pressed("toggle_modifer_select") 
	for key in _keys.get_children():
		key.modifier_select = _modifier_select
