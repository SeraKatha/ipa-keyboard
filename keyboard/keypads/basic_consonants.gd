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
			IPA.FRICATIVE_BILABIAL_UNVOICED,
			IPA.FRICATIVE_BILABIAL_VOICED,
		],
		[
			IPA.FRICATIVE_LABIODENTAL_UNVOICED,
			IPA.FRICATIVE_LABIODENTAL_VOICED,
		],
		[
			IPA.FRICATIVE_DENTAL_UNVOICED,
			IPA.FRICATIVE_DENTAL_VOICED,
		],
		[
			IPA.FRICATIVE_ALVEOLAR_UNVOICED,
			IPA.FRICATIVE_ALVEOLAR_VOICED,
		],
		[
			IPA.FRICATIVE_POSTAVEOLAR_UNVOICED,
			IPA.FRICATIVE_POSTAVEOLAR_VOICED,
		],
		[
			IPA.FRICATIVE_RETROFLEX_UNVOICED,
			IPA.FRICATIVE_RETROFLEX_VOICED,
		],
		[
			IPA.FRICATIVE_PALATAL_UNVOICED,
			IPA.FRICATIVE_PALATAL_VOICED,
		],
		[
			IPA.FRICATIVE_VELAR_UNVOICED,
			IPA.FRICATIVE_VELAR_VOICED,
		],
		[
			IPA.FRICATIVE_UVULAR_UNVOICED,
			IPA.FRICATIVE_UVULAR_VOICED,
		],
		[
			IPA.FRICATIVE_PHARYNGEAL_UNVOICED,
			IPA.FRICATIVE_PHARYNGEAL_VOICED,
		],
		[
			IPA.FRICATIVE_GLOTAL_UNVOICED,
			IPA.FRICATIVE_GLOTAL_VOICED,
		]
	]
	
	var lateral_fricatives = [
		[null, null],
		[null, null],
		[null, null],
		[
			IPA.FRICATIVE_LATERAL_ALVEOLAR_UNVOICED,
			IPA.FRICATIVE_LATERAL_ALVEOLAR_VOICED,
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
			IPA.APPROXIMANT_LABIALVELAR,
		],
		[
			null,
			IPA.APPROXIMANT_LABIODENTAL,
		],
		[null, null],
		[
			null,
			IPA.APPROXIMANT_ALVEOLAR,
		],
		[null, null],
		[
			null,
			IPA.APPROXIMANT_RETROFLEX,
		],
		[
			null,
			IPA.APPROXIMANT_PALATAL,
		],
		[
			null,
			IPA.APPROXIMANT_VELAR,
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
			IPA.APPROXIMANT_LATERAL_ALVEOLAR,
		],
		[null, null],
		[
			null,
			IPA.APPROXIMANT_LATERAL_RETROFLEX,
		],
		[
			null,
			IPA.APPROXIMANT_LATERAL_PALATAL,
		],
		[
			null,
			IPA.APPROXIMANT_LATERAL_VELAR,
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
