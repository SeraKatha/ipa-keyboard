class_name IPA extends Node


class Item:
	var _symbol : String
	func get_ipa_symbol() -> String:
		return _symbol


class Sound extends Item:
	func _init(symbol : String) -> void:
		_symbol = symbol
	func with_modifier(modifier : Modifier) -> IPA.Sound:
		return IPA.Sound.new(modifier.get_ipa_symbol() % self.get_ipa_symbol())


class Modifier extends Item:
	func _init(symbol : String) -> void:
		_symbol = symbol
