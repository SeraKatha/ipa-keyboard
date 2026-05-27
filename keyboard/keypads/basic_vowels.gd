extends BasicKeyPad

func _ready() -> void:
	var vowels = [
		[
			[
				[sound("i"), "ipa_vowel_close_front_unrounded"],
				[sound("y"), "ipa_vowel_close_front_rounded"],
			],
			[null, null],
			[
				[sound("ɨ"), "ipa_vowel_close_central_unrounded"],
				[sound("ʉ"), "ipa_vowel_close_central_rounded"],
			],
			[null, null],
			[
				[sound("ɯ"), "ipa_vowel_close_back_unrounded"],
				[sound("u"), "ipa_vowel_close_back_rounded"],
			],
		], 
		[
			[null, null],
			[
				[sound("ɪ"), "ipa_vowel_nearclose_nearfront_unrounded"],
				[sound("ʏ"), "ipa_vowel_nearclose_nearfront_rounded"],
			],
			[null, null],
			[
				[sound("ʊ"), "ipa_vowel_nearclose_nearback"],
				null
			],
			[null, null],
		], 
		[
			[
				[sound("e"), "ipa_vowel_closemid_front_unrounded"],
				[sound("ø"), "ipa_vowel_closemid_front_rounded"],
			],
			[null, null],
			[
				[sound("ɘ"), "ipa_vowel_closemid_central_unrounded"],
				[sound("ɵ"), "ipa_vowel_closemid_central_rounded"],
			],
			[null, null],
			[
				[sound("ɤ"), "ipa_vowel_closemid_back_unrounded"],
				[sound("o"), "ipa_vowel_closemid_back_rounded"],
			]
		],
		[
			[
				[sound("e̞"), "ipa_vowel_mid_front_unrounded"],
				[sound("ø̞"), "ipa_vowel_mid_front_rounded"],
			],
			[null, null],
			[
				[sound("ə"), "ipa_vowel_mid_central"],
				null,
			],
			[null, null],
			[
				[sound("ɤ̞"), "ipa_vowel_mid_back_unrounded"],
				[sound("o̞"), "ipa_vowel_mid_back_rounded"],
			],
		],
		[
			[
				[sound("ɛ"), "ipa_vowel_openmid_front_unrounded"],
				[sound("œ"), "ipa_vowel_openmid_front_rounded"],
			],
			[null, null],
			[
				[sound("ɜ"), "ipa_vowel_openmid_central_unrounded"],
				[sound("ɞ"), "ipa_vowel_openmid_central_rounded"]
			],
			[null, null],
			[
				[sound("ʌ"), "ipa_vowel_openmid_back_unrounded"],
				[sound("ɔ"), "ipa_vowel_openmid_back_rounded"],
			],
		],
		[
			[
				[sound("æ"), "ipa_vowel_nearopen_front_unrounded"],
				null
			],
			[null, null],
			[
				[sound("ɐ"), "ipa_vowel_nearopen_central"],
				null
			],
			[null, null],
			[null, null],
		],
		[
			[
				[sound("a"), "ipa_vowel_open_front_unrounded"],
				[sound("ɶ"), "ipa_vowel_open_front_rounded"],
			],
			[null, null],
			[
				[sound("ä"), "ipa_vowel_open_central"],
				null
			],
			[null, null],
			[
				[sound("ɑ"), "ipa_vowel_open_back_unrounded"],
				[sound("ɒ"), "ipa_vowel_open_back_rounded"]
			],
		],
	]
	
	fill(vowels)
