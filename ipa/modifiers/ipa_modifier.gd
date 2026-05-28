class_name IPA_Modifier extends IPA_Item

static func make(symbol : String):
	var modifier = IPA_Modifier.new()
	modifier._symbol = symbol
	return modifier
