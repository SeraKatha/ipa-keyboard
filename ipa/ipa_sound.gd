class_name IPA_Sound extends IPA_Item

func _init(symbol : String) -> void:
	_symbol = symbol

func with_modifier(modifier : IPA_Modifier) -> IPA_Sound:
	return IPA_Sound.new(modifier.get_ipa_symbol() % self.get_ipa_symbol())
