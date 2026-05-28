extends Control


@onready var _preview: LineEdit = %Preview
@onready var _container: VBoxContainer = %Container
var _keyboard

const KEYBOARD = preload("uid://bm4iou4241gt4")

var _current_input : Array[IPA.Sound] = [];
var _current_text : String = ""
var _cursor_position = 0
var _caret_stop : Array[int] = []


const LOCK_EXPIRATION = 2;


func _init_config():
	if not FileAccess.file_exists("user://config.cfg"):
		var config = ConfigFile.new()
		config.set_value("ui", "scale", 1.0)
		for action in InputMap.get_actions():
			if action.begins_with("ipa_"):
				var action_event : InputEvent = InputMap.action_get_events(action)[0]
				config.set_value("key_bindings", action, action_event.as_text().to_lower())
		config.save("user://config.cfg")


func _load_config():
	var config = ConfigFile.new()
	config.load("user://config.cfg")
	var application_scale = config.get_value("ui", "scale", 1.0)
	get_tree().root.content_scale_factor = application_scale
	var window_size = Vector2i(Vector2(890, 344) * application_scale)
	DisplayServer.window_set_size(window_size)
	if config.has_section("key_bindings"):
		for key in config.get_section_keys("key_bindings"):
			var event_action_str = config.get_value("key_bindings", key).to_lower()
			var event_action_keys = event_action_str.split("+")
			var input_event_key = InputMap.action_get_events(key)[0]
			input_event_key.shift_pressed = event_action_keys.has("shift")
			input_event_key.ctrl_pressed = event_action_keys.has("ctrl")
			input_event_key.alt_pressed = event_action_keys.has("alt")
			input_event_key.keycode = OS.find_keycode_from_string(event_action_keys[-1])
	var screen_size : Vector2i = DisplayServer.screen_get_size();
	var window_position : Vector2i = screen_size / Vector2i(2, 1) - window_size / Vector2i(2, 1)
	DisplayServer.window_set_position(window_position)

const FILE_LOCK : String = "user://lock"

func _is_lock_fresh():
	var lock_file = FileAccess.open(FILE_LOCK, FileAccess.READ)
	var timestamp_lock = lock_file.get_64()
	lock_file.close()
	var timestamp_now = Time.get_unix_time_from_system()
	var is_already_running = timestamp_now - timestamp_lock < 2
	return is_already_running

func _ready() -> void:
	_init_config()
	_load_config()
	
	if FileAccess.file_exists(FILE_LOCK) and _is_lock_fresh():
		get_tree().quit()
	else:
		_refresh_lock()
		_keyboard = KEYBOARD.instantiate()
		_container.add_child(_keyboard)
		_keyboard.pressed_backspace.connect(_on_keyboard_pressed_backspace)
		_keyboard.pressed_clear.connect(_on_keyboard_pressed_clear)
		_keyboard.pressed_close.connect(_on_keyboard_pressed_close)
		_keyboard.pressed_copy.connect(_on_keyboard_pressed_copy)
		_keyboard.pressed_delete.connect(_on_keyboard_pressed_delete)
		_keyboard.pressed_left.connect(_on_keyboard_pressed_left)
		_keyboard.pressed_right.connect(_on_keyboard_pressed_right)
		_keyboard.typed_sound.connect(_on_keyboard_typed_sound)


func _on_keyboard_typed_sound(sound: IPA.Sound) -> void:
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
		_current_text += _element.get_ipa_symbol()
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


func _refresh_lock():
	var	lock_file = FileAccess.open(FILE_LOCK, FileAccess.WRITE)
	lock_file.store_64(Time.get_unix_time_from_system())
	lock_file.close()
	
	
func _exit_tree() -> void:
	DirAccess.remove_absolute(FILE_LOCK)

func _on_lock_timer_timeout() -> void:
	_refresh_lock()

func _on_tree_exiting() -> void:
	print("AAA")
