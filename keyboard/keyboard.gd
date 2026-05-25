extends Control

const KEY = preload("uid://efvn2xxhdkox")

signal typed_sound(string : String)
signal pressed_copy();
signal pressed_clear();
signal pressed_backspace();


func _on_copy_pressed() -> void:
	pressed_copy.emit()


func _on_clear_pressed() -> void:
	pressed_clear.emit()


func _on_backspace_pressed() -> void:
	pressed_backspace.emit()


func _on_typed(sound: String) -> void:
	typed_sound.emit(sound)
