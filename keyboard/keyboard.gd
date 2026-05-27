extends Control

const KEY = preload("uid://efvn2xxhdkox")

signal typed_sound(string : IPA.Sound)
signal pressed_copy()
signal pressed_clear()
signal pressed_backspace()
signal pressed_delete()
signal pressed_left()
signal pressed_right()
signal pressed_close()

@onready var _modifier_pad: ModifierPad = %ModifierPad

func _on_copy_pressed() -> void:
	pressed_copy.emit()


func _on_clear_pressed() -> void:
	pressed_clear.emit()


func _on_backspace_pressed() -> void:
	pressed_backspace.emit()


func _on_delete_pressed() -> void:
	pressed_delete.emit()


func _on_pressed_left() -> void:
	pressed_left.emit()
	
	
func _on_pressed_right() -> void:
	pressed_right.emit()


func _on_typed(sound: String) -> void:
	typed_sound.emit(sound)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("copy"):
		_on_copy_pressed();
	if event.is_action_pressed("close"):
		_on_close_pressed();
	if event.is_action("backspace") and event.is_pressed():
		_on_backspace_pressed();
	if event.is_action("delete") and event.is_pressed():
		_on_delete_pressed();
	if event.is_action("clear") and event.is_pressed():
		_on_clear_pressed();
	if event.is_action("cursor_left") and event.is_pressed():
		_on_pressed_left();
	if event.is_action("cursor_right") and event.is_pressed():
		_on_pressed_right();


func _on_close_pressed() -> void:
	pressed_close.emit()


func _on_basic_consonants_typed(sound: IPA.Sound) -> void:
	_modifier_pad.apply(sound)


func _on_basic_vowels_typed(sound: IPA.Sound) -> void:
	_modifier_pad.apply(sound)


func _on_modifier_pad_typed(sound: IPA.Sound) -> void:
	typed_sound.emit(sound)
