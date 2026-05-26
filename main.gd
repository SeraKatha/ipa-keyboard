extends Control


@onready var _preview: LineEdit = %Preview


var _current_input : PackedStringArray = [];
var _current_text : String = ""
var _cursor_position = 0
var _caret_stop : Array[int] = []

func _init_config():
	if not FileAccess.file_exists("user://config.cfg"):
		var config = ConfigFile.new()
		config.set_value("ui", "scale", 1.0)
		for action in InputMap.get_actions():
			if action.begins_with("ipa_"):
				var action_event : InputEvent = InputMap.action_get_events(action)[0]
				config.set_value("keybindings", action, action_event.as_text())
		config.save("user://config.cfg")
		

func _ready() -> void:
	_init_config()
	var config = ConfigFile.new();
	config.load("user://config.cfg")
	var application_scale = config.get_value("ui", "scale", 1.0)
	get_tree().root.content_scale_factor = application_scale
	DisplayServer.window_set_size(Vector2i(1020, 416) * application_scale)
	ConfigFile.new()
	
	
func _on_keyboard_typed_sound(sound: String) -> void:
	_current_input.insert(_cursor_position, sound)
	_refresh_text()
	_caret_stop.push_back(_current_text.length())
	_cursor_position += 1;
	_refresh_caret()
	

func _on_keyboard_pressed_copy() -> void:
	DisplayServer.clipboard_set(_current_text)


func _on_keyboard_pressed_clear() -> void:
	_current_input = []
	_refresh_text()
	_preview.caret_column = 0
	_cursor_position = 0
	_refresh_caret()
	

func _on_keyboard_pressed_backspace() -> void:
	if _cursor_position != 0:
		var i = _cursor_position - 1
		_caret_stop.remove_at(i)
		_current_input.remove_at(i)
		_refresh_text()
		_cursor_position -= 1;
		_refresh_caret()


func _on_keyboard_pressed_delete() -> void:
	if _cursor_position != _current_input.size():
		var i = _cursor_position
		_caret_stop.remove_at(i)
		_current_input.remove_at(i)
		_refresh_text()
		_refresh_caret()


func _refresh_text():
	_current_text = ""
	_caret_stop.clear()
	_caret_stop.push_back(0)
	for _element in _current_input:
		_current_text += _element
		_caret_stop.append(_current_text.length())
	_preview.text = _current_text


func _refresh_caret():
	_preview.caret_column = _caret_stop[_cursor_position]



func _on_keyboard_pressed_left() -> void:
	if _cursor_position > 0:
		_cursor_position -= 1;
		_refresh_caret()


func _on_keyboard_pressed_right() -> void:
	if _cursor_position < _current_input.size():
		_cursor_position += 1;
		_refresh_caret()


func _on_keyboard_pressed_close() -> void:
	get_tree().quit()
