extends BasicKeyPad


func _ready() -> void:
	var plosives = [
		[
			IPA.PLOSIVE_BILABIAL_UNVOICED,
			IPA.PLOSIVE_BILABIAL_VOICED,
		],
		[null, null],
		[null, null],
		[
			IPA.PLOSIVE_ALVEOLAR_UNVOICED,
			IPA.PLOSIVE_ALVEOLAR_VOICED,
		],
		[null, null],
		[
			IPA.PLOSIVE_RETROFLEX_UNVOICED,
			IPA.PLOSIVE_RETROFLEX_VOICED,
		],
		[
			IPA.PLOSIVE_PALATAL_UNVOICED,
			IPA.PLOSIVE_PALATAL_VOICED,
		],
		[
			IPA.PLOSIVE_VELAR_UNVOICED,
			IPA.PLOSIVE_VELAR_VOICED,
		],
		[
			IPA.PLOSIVE_UVULAR_UNVOICED,
			IPA.PLOSIVE_UVULAR_VOICED,
		],
		[null, null],
		[
			IPA.PLOSIVE_GLOTTAL,
			null,
		],
	]
	
	var nasals = [
		[
			null,
			IPA.NASAL_BILABIAL
		],
		[
			null,
			IPA.NASAL_LABIODENTAL,
		],
		[null, null],
		[null, null],
		[
			null,
			IPA.NASAL_ALVEOLAR
		],
		[
			null,
			IPA.NASAL_RETROFLEX
		],
		[
			null,
			IPA.NASAL_PALATAL
		],
		[
			null,
			IPA.NASAL_VELAR
		],
		[
			null,
			IPA.NASAL_UVULAR
		],
		[null, null],
		[null, null],
	]
	
	var trills = [
		[
			null,
			IPA.TRILL_BILABIAL,
		],
		[null, null],
		[null, null],
		[
			null,
			IPA.TRILL_AVEOLAR,
		],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[
			null,
			IPA.TRILL_UVULAR
		],
		[null, null],
		[null, null],
	]
	
	var taps = [
		[null, null],
		[
			null,
			IPA.TAP_LABIODENTAL,
		],
		[null, null],
		[
			null,
			IPA.TAP_ALVEOLAR,
		],
		[null, null],
		[
			null,
			IPA.TAP_RETROFLEX
		],
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
