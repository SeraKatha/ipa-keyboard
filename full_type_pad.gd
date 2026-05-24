class_name FullTypePad extends Control

func _apply_if(button : Button, sound  : String, modifier : String):
	if button.button_pressed:
		button.button_pressed = false;
		return modifier % sound;
	else:
		return sound
