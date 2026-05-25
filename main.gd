extends Control


@onready var _preview: LineEdit = %Preview


var _current_input : PackedStringArray = [];
var _current_text : String = ""
var _caret_stops : Array[int] = []


func _init_config():
	if not FileAccess.file_exists("user://config.cfg"):
		var config = ConfigFile.new()
		config.set_value("ui", "scale", 1.0)
		config.save("user://config.cfg")


func _ready() -> void:
	_init_config()
	
	var config = ConfigFile.new();
	config.load("user://config.cfg")
	var application_scale = config.get_value("ui", "scale", 1.0)
	get_tree().root.content_scale_factor = application_scale
	DisplayServer.window_set_size(Vector2i(1020, 420) * application_scale)
	ConfigFile.new()
	
func _on_keyboard_typed_sound(sound: String) -> void:
	var caret_column = _preview.caret_column
	_current_input.insert(caret_column, sound)
	_refresh_text()
	_caret_stops.append(caret_column);
	_preview.caret_column = caret_column + 1

func _on_keyboard_pressed_copy() -> void:
	DisplayServer.clipboard_set(_current_text)


func _on_keyboard_pressed_clear() -> void:
	_current_input = []
	_refresh_text()
	_preview.caret_column = 0;


func _on_keyboard_pressed_backspace() -> void:
	var caret_column = _preview.caret_column
	if not _caret_stops.is_empty():
		_current_input.remove_at(_current_input.size() - 1)
		_refresh_text()
		_preview.caret_column = _caret_stops.pop_back()


func _refresh_text():
	_current_text = "".join(_current_input);
	_preview.text = _current_text
