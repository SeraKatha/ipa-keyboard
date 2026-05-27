extends BasicKeyPad

func _ready() -> void:
	var plosives = [
		[
			sound("p").input_action("ipa_plosive_bilabial_unvoiced"),
			sound("b").input_action("ipa_plosive_bilabial_voiced"),
		],
		[null, null],
		[null, null],
		[
			sound("t").input_action("ipa_plosive_alveolar_unvoiced"),
			sound("d").input_action("ipa_plosive_alveolar_voiced"),
		],
		[null, null],
		[
			sound("ʈ").input_action("ipa_plosive_retroflex_unvoiced"),
			sound("ɖ").input_action("ipa_plosive_retroflex_voiced"),
		],
		[
			sound("c").input_action("ipa_plosive_palatal_unvoiced"),
			sound("ɟ").input_action("ipa_plosive_palatal_voiced"),
		],
		[
			sound("k").input_action("ipa_plosive_velar_unvoiced"),
			sound("g").input_action("ipa_plosive_velar_voiced"),
		],
		[
			sound("q").input_action("ipa_plosive_uvular_unvoiced"),
			sound("ɢ").input_action("ipa_plosive_uvular_voiced"),
		],
		[null, null],
		[
			sound("ʔ").input_action("ipa_plosive_glottal"),
			null
		],
	]
	
	var nasals = [
		[
			null,
			sound("m").input_action("ipa_nasal_bilabial")
		],
		[
			null,
			sound("ɱ").input_action("ipa_nasal_labiodental")
		],
		[null, null],
		[null, null],
		[
			null,
			sound("n").input_action("ipa_nasal_alveolar")
		],
		[
			null,
			sound("ɳ").input_action("ipa_nasal_retroflex")
		],
		[
			null,
			sound("ɲ").input_action("ipa_nasal_palatal")
		],
		[
			null,
			sound("ŋ").input_action("ipa_nasal_velar")
		],
		[
			null,
			sound("ɴ").input_action("ipa_nasal_uvular")
		],
		[null, null],
		[null, null],
	]
	
	var trills = [
		[null, sound("ʙ").input_action("ipa_trill_bilabial")],
		[null, null],
		[null, null],
		[null, sound("r").input_action("ipa_trill_aveolar")],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, sound("ʀ").input_action("ipa_trill_uvular")],
		[null, null],
		[null, null],
	]
	
	var taps = [
		[null, null],
		[null, sound("ⱱ").input_action("ipa_tap_labiodental")],
		[null, null],
		[null, sound("ɾ").input_action("ipa_tap_alveolar")],
		[null, null],
		[null, sound("ɽ").input_action("ipa_tap_retroflex")],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var fricatives = [
		[
			sound("ɸ").input_action("ipa_fricative_bilabial_unvoiced"),
			sound("β").input_action("ipa_fricative_bilabial_voiced"),
		],
		[
			sound("f").input_action("ipa_fricative_labiodental_unvoiced"),
			sound("v").input_action("ipa_fricative_labiodental_voiced"),
		],
		[
			sound("θ").input_action("ipa_fricative_dental_unvoiced"),
			sound("ð").input_action("ipa_fricative_dental_voiced"),
		],
		[
			sound("s").input_action("ipa_fricative_alveolar_unvoiced"),
			sound("z").input_action("ipa_fricative_alveolar_voiced"),
		],
		[
			sound("ʃ").input_action("ipa_fricative_postaveolar_unvoiced"),
			sound("ʒ").input_action("ipa_fricative_postaveolar_voiced"),
		],
		[
			sound("ʂ").input_action("ipa_fricative_retroflex_unvoiced"),
			sound("ʐ").input_action("ipa_fricative_retroflex_voiced"),
		],
		[
			sound("ç").input_action("ipa_fricative_palatal_unvoiced"),
			sound("ʝ").input_action("ipa_fricative_palatal_voiced"),
		],
		[
			sound("x").input_action("ipa_fricative_velar_unvoiced"),
			sound("ɣ").input_action("ipa_fricative_velar_voiced"),
		],
		[
			sound("χ").input_action("ipa_fricative_uvular_unvoiced"),
			sound("ʁ").input_action("ipa_fricative_uvular_voiced"),
		],
		[
			sound("ħ").input_action("ipa_fricative_pharyngeal_unvoiced"),
			sound("ʕ").input_action("ipa_fricative_pharyngeal_voiced"),
		],
		[
			sound("h").input_action("ipa_fricative_glotal_unvoiced"),
			sound("ɦ").input_action("ipa_fricative_glotal_voiced"),
		],
	]
	
	var lateral_fricatives = [
		[null, null],
		[null, null],
		[null, null],
		[
			sound("ɬ").input_action("ipa_fricative_lateral_alveolar_unvoiced"),
			sound("ɮ").input_action("ipa_fricative_lateral_alveolar_voiced")
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
			sound("w").input_action("ipa_approximant_labialvelar"),
		],
		[
			null,
			sound("ʋ").input_action("ipa_approximant_labiodental"),
		],
		[null, null],
		[
			null,
			sound("ɹ").input_action("ipa_approximant_alveolar"),
		],
		[null, null],
		[
			null,
			sound("ɻ").input_action("ipa_approximant_retroflex"),
		],
		[
			null,
			sound("j").input_action("ipa_approximant_palatal"),
		],
		[
			null,
			sound("ɰ").input_action("ipa_approximant_velar"),
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
			sound("l").input_action("ipa_approximant_lateral_alveolar"),
		],
		[null, null],
		[
			null,
			sound("ɭ").input_action("ipa_approximant_lateral_retroflex"),
		],
		[
			null,
			sound("ʎ").input_action("ipa_approximant_lateral_palatal"),
		],
		[
			null,
			sound("ʟ").input_action("ipa_approximant_lateral_velar"),
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
