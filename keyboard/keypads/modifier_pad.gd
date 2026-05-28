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
		IPA.MODIFIER_AFFRICATIVE,
		IPA.MODIFIER_ASPIRATED,
		IPA.MODIFIER_RHOTIC_HOOK,
		IPA.MODIFIER_RHOTIC_SUPERSCRIPT,
		IPA.MODIFIER_EJECTIVE,
		IPA.MODIFIER_LABIALIZED,
		IPA.MODIFIER_PALATALIZED,
		IPA.MODIFIER_VELARIZED,
		IPA.MODIFIER_PHARYNGEALIZED,
		IPA.MODIFIER_GLOTTALIZED,
		IPA.MODIFIER_DIPHTHONG,
		IPA.MODIFIER_LONG_VOWEL,
		IPA.MODIFIER_HALF_LONG_VOWEL,
		IPA.MODIFIER_EXTRA_SHORT_VOWEL,
	]
	
	_keys.columns = modifiers.size()
	
	for modifier in modifiers:
		var button = MODIFIER_KEY.instantiate()
		var action = "ipa_%s" % modifier.get_sound_name()
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
