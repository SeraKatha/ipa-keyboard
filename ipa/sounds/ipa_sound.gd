class_name IPA_Sound extends IPA_Item


static func from_string(symbol : String) -> IPA_Sound:
	var sound = IPA_Sound.new()
	sound._symbol = symbol
	return sound
	
	
func with_modifier(modifier : IPA_Modifier) -> IPA_Sound:
	return IPA_Sound.from_string(modifier.get_ipa_symbol() % self.get_ipa_symbol())


func get_sound_name() -> String:
	return resource_path.get_file().get_basename()
