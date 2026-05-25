@abstract class_name ModifiedKeyPad extends Control

signal typed(sound : String)


func _emit_typed(sound : String):
	typed.emit(sound)


func _apply_if(button : Button, sound  : String, modifier : String):
	if button.button_pressed:
		button.button_pressed = false;
		return modifier % sound;
	else:
		return sound
