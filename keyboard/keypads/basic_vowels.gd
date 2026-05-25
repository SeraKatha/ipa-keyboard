extends BasicKeyPad

func _ready() -> void:
	var vowels = [
		[
			[
				sound("i").overide_name("vowel_close_front_unrounded"),
				sound("y").overide_name("vowel_close_front_rounded"),
			],
			[null, null],
			[
				sound("ɨ").overide_name("vowel_close_central_unrounded"),
				sound("ʉ").overide_name("vowel_close_central_rounded")
			],
			[null, null],
			[
				sound("ɯ").overide_name("vowel_close_back_unrounded"),
				sound("u").overide_name("vowel_close_back_rounded")
			],
		], 
		[
			[null, null],
			[
				sound("ɪ").overide_name("vowel_nearclose_nearfront_unrounded"),
				sound("ʏ").overide_name("vowel_nearclose_nearfront_rounded")
			],
			[null, null],
			[
				sound("ʊ").overide_name("vowel_nearclose_nearback"),
				null
			],
			[null, null],
		], 
		[
			[
				sound("e").overide_name("vowel_closemid_front_unrounded"),
				sound("ø").overide_name("vowel_closemid_front_rounded"),
			],
			[null, null],
			[
				sound("ɘ").overide_name("vowel_closemid_central_unrounded"),
				sound("ɵ").overide_name("vowel_closemid_central_rounded"),
			],
			[null, null],
			[
				sound("ɤ").overide_name("vowel_closemid_back_unrounded"),
				sound("o").overide_name("vowel_closemid_back_rounded")
			]
		],
		[
			[
				sound("e̞").overide_name("vowel_mid_front_unrounded"),
				sound("ø̞").overide_name("vowel_mid_front_rounded")
			],
			[null, null],
			[
				sound("ə").overide_name("vowel_mid_central"),
				null,
			],
			[null, null],
			[
				sound("ɤ̞").overide_name("vowel_mid_back_unrounded"),
				sound("o̞").overide_name("vowel_mid_back_rounded"),
			],
		],
		[
			[
				sound("ɛ").overide_name("vowel_openmid_front_unrounded"),
				sound("œ").overide_name("vowel_openmid_front_rounded")
			],
			[null, null],
			[
				sound("ɜ").overide_name("vowel_openmid_central_unrounded"),
				sound("ɞ").overide_name("vowel_openmid_central_rounded")
			],
			[null, null],
			[
				sound("ʌ").overide_name("vowel_openmid_back_unrounded"),
				sound("ɔ").overide_name("vowel_openmid_back_rounded"),
			],
		],
		[
			[
				sound("æ").overide_name("vowel_nearopen_front_unrounded"),
				null
			],
			[null, null],
			[
				sound("ɐ").overide_name("vowel_nearopen_central"),
				null
			],
			[null, null],
			[null, null],
		],
		[
			[
				sound("a").overide_name("vowel_open_front_unrounded"),
				sound("ɶ").overide_name("vowel_open_front_rounded"),
			],
			[null, null],
			[
				sound("ä").overide_name("vowel_open_central"),
				null
			],
			[null, null],
			[
				sound("ɑ").overide_name("vowel_open_back_unrounded"),
				sound("ɒ").overide_name("vowel_open_back_rounded")
			],
		],
	]
	
	fill(vowels)
