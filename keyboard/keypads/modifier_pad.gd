class_name ModifierPad extends Control

signal typed(sound : String)


var _modifier_select = false;


func _emit_typed(sound : String):
	if not _modifier_select:
		typed.emit(sound)


func _apply_if(button : Button, sound  : String, modifier : String):
	if button.button_pressed:
		button.button_pressed = false;
		return modifier % sound;
	else:
		return sound


func _toggle_if(button : Button, event : InputEvent, action : String):
	if InputMap.has_action(action) and event.is_action_pressed(action, false, true):
		button.button_pressed = !button.button_pressed


@onready var _affricative: Button = %Affricative

@onready var _aspirated: Button = %Aspirated
@onready var _rhotic_hook: Button = %RhoticHook
@onready var _rhotic_superscript: Button = %RhoticSuperscript

@onready var _ejective: Button = %Ejective

@onready var _labialized: Button = %Labialized
@onready var _palatalized: Button = %Palatalized
@onready var _velarized: Button = %Velarized
@onready var _pharyngealized: Button = %Pharyngealized
@onready var _glottalized: Button = %Glottalized

@onready var _diphthong: Button = %Diphthong
@onready var _long_vowel: Button = %LongVowel
@onready var _half_long_vowel: Button = %HalfLongVowel
@onready var _extra_short_vowel: Button = %ExtraShortVowel


func _ready() -> void:
	_affricative.set_hint("ipa_modifier_affricative")
	_aspirated.set_hint("ipa_modifier_aspirated")
	_ejective.set_hint("ipa_modifier_ejective")
	_rhotic_hook.set_hint("ipa_modifier_rhotic_hook")
	_rhotic_superscript.set_hint("ipa_modifier_rhotic_superscript")
	_labialized.set_hint("ipa_modifier_labialized")
	_palatalized.set_hint("ipa_modifier_palatalized")
	_velarized.set_hint("ipa_modifier_velarized")
	_pharyngealized.set_hint("ipa_modifier_pharyngealized")
	_glottalized.set_hint("ipa_modifier_glottalized")
	_diphthong.set_hint("ipa_modifier_diphthong")
	_long_vowel.set_hint("ipa_modifier_long_vowel")
	_half_long_vowel.set_hint("ipa_modifier_half_long_vowel")
	_extra_short_vowel.set_hint("ipa_modifier_extra_short_vowel")


func apply(sound: String) -> void:
	if not _modifier_select:
		sound = _apply_if(_affricative,        sound, "%s\u0361")
		sound = _apply_if(_aspirated,          sound, "%s\u02B0")
		sound = _apply_if(_rhotic_hook,        sound, "%s\u02DE")
		sound = _apply_if(_rhotic_superscript, sound, "%s\u02B4")
		sound = _apply_if(_ejective,           sound, "%s\u02BC")
		sound = _apply_if(_labialized,         sound, "%s\u02B7")
		sound = _apply_if(_palatalized,        sound, "%s\u02B2")
		sound = _apply_if(_velarized,          sound, "%s\u02E0")
		sound = _apply_if(_pharyngealized,     sound, "%s\u02E4")
		sound = _apply_if(_glottalized,        sound, "%s\u02C0")
		sound = _apply_if(_diphthong,          sound, "%s\u032F")
		sound = _apply_if(_long_vowel,         sound, "%s\u02D0")
		sound = _apply_if(_half_long_vowel,    sound, "%s\u02D1")
		sound = _apply_if(_extra_short_vowel,  sound, "%s\u0306")
		_emit_typed(sound)


func _handle_modifier_select(event: InputEvent) -> void:
	_toggle_if(_affricative,        event, "ipa_modifier_affricative")
	_toggle_if(_aspirated,          event, "ipa_modifier_aspirated")
	_toggle_if(_ejective,           event, "ipa_modifier_ejective")
	_toggle_if(_rhotic_hook,        event, "ipa_modifier_rhotic_hook")
	_toggle_if(_rhotic_superscript, event, "ipa_modifier_rhotic_superscript")
	_toggle_if(_labialized,         event, "ipa_modifier_labialized")
	_toggle_if(_palatalized,        event, "ipa_modifier_palatalized")
	_toggle_if(_velarized,          event, "ipa_modifier_velarized")
	_toggle_if(_pharyngealized,     event, "ipa_modifier_pharyngealized")
	_toggle_if(_glottalized,        event, "ipa_modifier_glottalized")
	_toggle_if(_diphthong,          event, "ipa_modifier_diphthong")
	_toggle_if(_long_vowel,         event, "ipa_modifier_long_vowel")
	_toggle_if(_half_long_vowel,    event, "ipa_modifier_half_long_vowel")
	_toggle_if(_extra_short_vowel,  event, "ipa_modifier_extra_short_vowel")


func _process(_delta: float) -> void:
	_modifier_select = Input.is_action_pressed("toggle_modifer_select")


func _input(event: InputEvent) -> void:
	if _modifier_select:
		_handle_modifier_select(event)
		
