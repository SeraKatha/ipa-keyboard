extends Node

const LOCK_FILE_PATH : String = "user://lock"
const LOCK_EXPIRATION = 2;


func _is_lock_fresh():
	var lock_file = FileAccess.open(LOCK_FILE_PATH, FileAccess.READ)
	var timestamp_lock = lock_file.get_64()
	lock_file.close()
	var timestamp_now = Time.get_unix_time_from_system()
	var is_already_running = timestamp_now - timestamp_lock < LOCK_EXPIRATION
	return is_already_running


func try_lock() -> bool:
	if FileAccess.file_exists(LOCK_FILE_PATH) and _is_lock_fresh():
		get_tree().quit()
		return false
	else:
		_refresh_lock()
		return true


func _refresh_lock():
	var	lock_file = FileAccess.open(LOCK_FILE_PATH, FileAccess.WRITE)
	lock_file.store_64(Time.get_unix_time_from_system())
	lock_file.close()


func _exit_tree() -> void:
	DirAccess.remove_absolute(LOCK_FILE_PATH)


func _on_lock_timer_timeout() -> void:
	_refresh_lock()
