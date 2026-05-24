extends Control

signal typed(sound : String)

@onready var _aspirated: Button = %Aspirated
@onready var _ejective: Button = %Ejective
@onready var _affricative: Button = %Affricative

@onready var _labialized: Button = %Labialized
@onready var _palatalized: Button = %Palatalized
@onready var _velarized: Button = %Velarized
@onready var _pharyngealized: Button = %Pharyngealized
@onready var _glottalized: Button = %Glottalized


func _on_basic_consonants_typed(sound: String) -> void:
	sound = _apply_if(_aspirated,      sound, "%s\u02B0")
	sound = _apply_if(_labialized,     sound, "%s\u02B7")
	sound = _apply_if(_palatalized,    sound, "%s\u02B2")
	sound = _apply_if(_velarized,      sound, "%s\u02E0")
	sound = _apply_if(_pharyngealized, sound, "%s\u02E4")
	sound = _apply_if(_glottalized,    sound, "%s\u02C0")
	sound = _apply_if(_ejective,       sound, "%s\u02BC")
	sound = _apply_if(_affricative,    sound, "\u0361%s")
	typed.emit(sound)


func _apply_if(button : Button, sound  : String, modifier : String):
	if button.button_pressed:
		button.button_pressed = false;
		return modifier % sound;
	else:
		return sound
