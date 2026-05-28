extends Node

const LOCK_FILE_PATH : String = "user://lock"
const LOCK_EXPIRATION = 2;
var _locked = false;


func _is_lock_fresh():
	var lock_file = FileAccess.open(LOCK_FILE_PATH, FileAccess.READ)
	var timestamp_lock = lock_file.get_64()
	lock_file.close()
	var timestamp_now = Time.get_unix_time_from_system() as int
	var is_already_running = timestamp_now - timestamp_lock < LOCK_EXPIRATION
	return is_already_running


func _acquire_lock() -> bool:
	var already_locked = FileAccess.file_exists(LOCK_FILE_PATH) and _is_lock_fresh()
	_locked = not(already_locked)
	return _locked


func try_lock() -> bool:
	if _acquire_lock():
		_refresh_lock()
	else:
		get_tree().quit()
	return _locked


func _refresh_lock():
	var	lock_file = FileAccess.open(LOCK_FILE_PATH, FileAccess.WRITE)
	var timestamp = Time.get_unix_time_from_system() as int
	lock_file.store_64(timestamp)
	lock_file.close()


func _remove_lock():
	if _locked:
		DirAccess.remove_absolute(LOCK_FILE_PATH)


func _exit_tree() -> void:
	_remove_lock()


func _on_lock_timer_timeout() -> void:
	_refresh_lock()
