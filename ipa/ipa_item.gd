class_name IPA_Item extends Resource

@export var _symbol : String

func get_ipa_symbol() -> String:
	return _symbol

func get_sound_name() -> String:
	return resource_path.get_file().get_basename()
