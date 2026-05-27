extends BasicKeyPad

func _ready() -> void:
	var plosives = [
		[
			[sound("p"),"ipa_plosive_bilabial_unvoiced"],
			[sound("b"),"ipa_plosive_bilabial_voiced"],
		],
		[null, null],
		[null, null],
		[
			[sound("t"),"ipa_plosive_alveolar_unvoiced"],
			[sound("d"),"ipa_plosive_alveolar_voiced"],
		],
		[null, null],
		[
			[sound("ʈ"),"ipa_plosive_retroflex_unvoiced"],
			[sound("ɖ"),"ipa_plosive_retroflex_voiced"],
		],
		[
			[sound("c"),"ipa_plosive_palatal_unvoiced"],
			[sound("ɟ"),"ipa_plosive_palatal_voiced"],
		],
		[
			[sound("k"),"ipa_plosive_velar_unvoiced"],
			[sound("g"),"ipa_plosive_velar_voiced"],
		],
		[
			[sound("q"),"ipa_plosive_uvular_unvoiced"],
			[sound("ɢ"),"ipa_plosive_uvular_voiced"],
		],
		[null, null],
		[
			[sound("ʔ"),"ipa_plosive_glottal"],
			null
		],
	]
	
	var nasals = [
		[
			null,
			[sound("m"),"ipa_nasal_bilabial"]
		],
		[
			null,
			[sound("ɱ"),"ipa_nasal_labiodental"]
		],
		[null, null],
		[null, null],
		[
			null,
			[sound("n"),"ipa_nasal_alveolar"]
		],
		[
			null,
			[sound("ɳ"),"ipa_nasal_retroflex"]
		],
		[
			null,
			[sound("ɲ"),"ipa_nasal_palatal"]
		],
		[
			null,
			[sound("ŋ"),"ipa_nasal_velar"]
		],
		[
			null,
			[sound("ɴ"),"ipa_nasal_uvular"]
		],
		[null, null],
		[null, null],
	]
	
	var trills = [
		[null, [sound("ʙ"),"ipa_trill_bilabial"]],
		[null, null],
		[null, null],
		[null, [sound("r"),"ipa_trill_aveolar"]],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, [sound("ʀ"),"ipa_trill_uvular"]],
		[null, null],
		[null, null],
	]
	
	var taps = [
		[null, null],
		[null, [sound("ⱱ"),"ipa_tap_labiodental"]],
		[null, null],
		[null, [sound("ɾ"),"ipa_tap_alveolar"]],
		[null, null],
		[null, [sound("ɽ"),"ipa_tap_retroflex"]],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var fricatives = [
		[
			[sound("ɸ"),"ipa_fricative_bilabial_unvoiced"],
			[sound("β"),"ipa_fricative_bilabial_voiced"],
		],
		[
			[sound("f"),"ipa_fricative_labiodental_unvoiced"],
			[sound("v"),"ipa_fricative_labiodental_voiced"],
		],
		[
			[sound("θ"),"ipa_fricative_dental_unvoiced"],
			[sound("ð"),"ipa_fricative_dental_voiced"],
		],
		[
			[sound("s"),"ipa_fricative_alveolar_unvoiced"],
			[sound("z"),"ipa_fricative_alveolar_voiced"],
		],
		[
			[sound("ʃ"),"ipa_fricative_postaveolar_unvoiced"],
			[sound("ʒ"),"ipa_fricative_postaveolar_voiced"],
		],
		[
			[sound("ʂ"),"ipa_fricative_retroflex_unvoiced"],
			[sound("ʐ"),"ipa_fricative_retroflex_voiced"],
		],
		[
			[sound("ç"),"ipa_fricative_palatal_unvoiced"],
			[sound("ʝ"),"ipa_fricative_palatal_voiced"],
		],
		[
			[sound("x"),"ipa_fricative_velar_unvoiced"],
			[sound("ɣ"),"ipa_fricative_velar_voiced"],
		],
		[
			[sound("χ"),"ipa_fricative_uvular_unvoiced"],
			[sound("ʁ"),"ipa_fricative_uvular_voiced"],
		],
		[
			[sound("ħ"),"ipa_fricative_pharyngeal_unvoiced"],
			[sound("ʕ"),"ipa_fricative_pharyngeal_voiced"],
		],
		[
			[sound("h"),"ipa_fricative_glotal_unvoiced"],
			[sound("ɦ"),"ipa_fricative_glotal_voiced"],
		],
	]
	
	var lateral_fricatives = [
		[null, null],
		[null, null],
		[null, null],
		[
			[sound("ɬ"),"ipa_fricative_lateral_alveolar_unvoiced"],
			[sound("ɮ"),"ipa_fricative_lateral_alveolar_voiced"],
		],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var approximants = [
		[
			null, 
			[sound("w"),"ipa_approximant_labialvelar"],
		],
		[
			null,
			[sound("ʋ"),"ipa_approximant_labiodental"],
		],
		[null, null],
		[
			null,
			[sound("ɹ"),"ipa_approximant_alveolar"],
		],
		[null, null],
		[
			null,
			[sound("ɻ"),"ipa_approximant_retroflex"],
		],
		[
			null,
			[sound("j"),"ipa_approximant_palatal"],
		],
		[
			null,
			[sound("ɰ"),"ipa_approximant_velar"],
		],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var lateral_approximants = [
		[null, null],
		[null, null],
		[null, null],
		[
			null,
			[sound("l"),"ipa_approximant_lateral_alveolar"],
		],
		[null, null],
		[
			null,
			[sound("ɭ"),"ipa_approximant_lateral_retroflex"],
		],
		[
			null,
			[sound("ʎ"),"ipa_approximant_lateral_palatal"],
		],
		[
			null,
			[sound("ʟ"),"ipa_approximant_lateral_velar"],
		],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var event = InputEventKey.new()
	event.keycode = KEY_T
	event.shift_pressed = true
	
	var consonants = [
		plosives,
		nasals,
		trills,
		taps,
		fricatives,
		lateral_fricatives,
		approximants,
		lateral_approximants,
	]
	
	fill(consonants)
