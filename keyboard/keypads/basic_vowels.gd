extends BasicKeyPad

func _ready() -> void:
	var vowels = [
		[
			[
				sound("i").input_action("ipa_vowel_close_front_unrounded"),
				sound("y").input_action("ipa_vowel_close_front_rounded"),
			],
			[null, null],
			[
				sound("ɨ").input_action("ipa_vowel_close_central_unrounded"),
				sound("ʉ").input_action("ipa_vowel_close_central_rounded")
			],
			[null, null],
			[
				sound("ɯ").input_action("ipa_vowel_close_back_unrounded"),
				sound("u").input_action("ipa_vowel_close_back_rounded")
			],
		], 
		[
			[null, null],
			[
				sound("ɪ").input_action("ipa_vowel_nearclose_nearfront_unrounded"),
				sound("ʏ").input_action("ipa_vowel_nearclose_nearfront_rounded")
			],
			[null, null],
			[
				sound("ʊ").input_action("ipa_vowel_nearclose_nearback"),
				null
			],
			[null, null],
		], 
		[
			[
				sound("e").input_action("ipa_vowel_closemid_front_unrounded"),
				sound("ø").input_action("ipa_vowel_closemid_front_rounded"),
			],
			[null, null],
			[
				sound("ɘ").input_action("ipa_vowel_closemid_central_unrounded"),
				sound("ɵ").input_action("ipa_vowel_closemid_central_rounded"),
			],
			[null, null],
			[
				sound("ɤ").input_action("ipa_vowel_closemid_back_unrounded"),
				sound("o").input_action("ipa_vowel_closemid_back_rounded")
			]
		],
		[
			[
				sound("e̞").input_action("ipa_vowel_mid_front_unrounded"),
				sound("ø̞").input_action("ipa_vowel_mid_front_rounded")
			],
			[null, null],
			[
				sound("ə").input_action("ipa_vowel_mid_central"),
				null,
			],
			[null, null],
			[
				sound("ɤ̞").input_action("ipa_vowel_mid_back_unrounded"),
				sound("o̞").input_action("ipa_vowel_mid_back_rounded"),
			],
		],
		[
			[
				sound("ɛ").input_action("ipa_vowel_openmid_front_unrounded"),
				sound("œ").input_action("ipa_vowel_openmid_front_rounded")
			],
			[null, null],
			[
				sound("ɜ").input_action("ipa_vowel_openmid_central_unrounded"),
				sound("ɞ").input_action("ipa_vowel_openmid_central_rounded")
			],
			[null, null],
			[
				sound("ʌ").input_action("ipa_vowel_openmid_back_unrounded"),
				sound("ɔ").input_action("ipa_vowel_openmid_back_rounded"),
			],
		],
		[
			[
				sound("æ").input_action("ipa_vowel_nearopen_front_unrounded"),
				null
			],
			[null, null],
			[
				sound("ɐ").input_action("ipa_vowel_nearopen_central"),
				null
			],
			[null, null],
			[null, null],
		],
		[
			[
				sound("a").input_action("ipa_vowel_open_front_unrounded"),
				sound("ɶ").input_action("ipa_vowel_open_front_rounded"),
			],
			[null, null],
			[
				sound("ä").input_action("ipa_vowel_open_central"),
				null
			],
			[null, null],
			[
				sound("ɑ").input_action("ipa_vowel_open_back_unrounded"),
				sound("ɒ").input_action("ipa_vowel_open_back_rounded")
			],
		],
	]
	
	fill(vowels)
