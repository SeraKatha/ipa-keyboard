extends BasicKeyPad

func _ready() -> void:
	var plosives = [
		[
			sound("p").overide_name("plosive_bilabial_unvoiced"),
			sound("b").overide_name("plosive_bilabial_voiced"),
		],
		[null, null],
		[null, null],
		[
			sound("t").overide_name("plosive_alveolar_unvoiced"),
			sound("d").overide_name("plosive_alveolar_voiced"),
		],
		[null, null],
		[
			sound("ʈ").overide_name("plosive_retroflex_unvoiced"),
			sound("ɖ").overide_name("plosive_retroflex_voiced"),
		],
		[
			sound("c").overide_name("plosive_palatal_unvoiced"),
			sound("ɟ").overide_name("plosive_palatal_voiced"),
		],
		[
			sound("k").overide_name("plosive_velar_unvoiced"),
			sound("g").overide_name("plosive_velar_voiced"),
		],
		[
			sound("q").overide_name("plosive_uvular_unvoiced"),
			sound("ɢ").overide_name("plosive_uvular_voiced"),
		],
		[null, null],
		[
			sound("ʔ").overide_name("plosive_glottal"),
			null
		],
	]
	
	var nasals = [
		[
			null,
			sound("m").overide_name("nasal_bilabial")
		],
		[
			null,
			sound("ɱ").overide_name("nasal_labiodental")
		],
		[null, null],
		[null, null],
		[
			null,
			sound("n").overide_name("nasal_alveolar")
		],
		[
			null,
			sound("ɳ").overide_name("nasal_retroflex")
		],
		[
			null,
			sound("ɲ").overide_name("nasal_palatal")
		],
		[
			null,
			sound("ŋ").overide_name("nasal_velar")
		],
		[
			null,
			sound("ɴ").overide_name("nasal_uvular")
		],
		[null, null],
		[null, null],
	]
	
	var trills = [
		[null, sound("ʙ").overide_name("trill_bilabial")],
		[null, null],
		[null, null],
		[null, sound("r").overide_name("trill_aveolar")],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, sound("ʀ").overide_name("trill_uvular")],
		[null, null],
		[null, null],
	]
	
	var taps = [
		[null, null],
		[null, sound("ⱱ").overide_name("tap_labiodental")],
		[null, null],
		[null, sound("ɾ").overide_name("tap_alveolar")],
		[null, null],
		[null, sound("ɽ").overide_name("tap_retroflex")],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var fricatives = [
		[
			sound("ɸ").overide_name("fricative_bilabial_unvoiced"),
			sound("β").overide_name("fricative_bilabial_voiced"),
		],
		[
			sound("f").overide_name("fricative_labiodental_unvoiced"),
			sound("v").overide_name("fricative_labiodental_voiced"),
		],
		[
			sound("θ").overide_name("fricative_dental_unvoiced"),
			sound("ð").overide_name("fricative_dental_voiced"),
		],
		[
			sound("s").overide_name("fricative_alveolar_unvoiced"),
			sound("z").overide_name("fricative_alveolar_voiced"),
		],
		[
			sound("ʃ").overide_name("fricative_postaveolar_unvoiced"),
			sound("ʒ").overide_name("fricative_postaveolar_voiced"),
		],
		[
			sound("ʂ").overide_name("fricative_retroflex_unvoiced"),
			sound("ʐ").overide_name("fricative_retroflex_voiced"),
		],
		[
			sound("ç").overide_name("fricative_palatal_unvoiced"),
			sound("ʝ").overide_name("fricative_palatal_voiced"),
		],
		[
			sound("x").overide_name("fricative_velar_unvoiced"),
			sound("ɣ").overide_name("fricative_velar_voiced"),
		],
		[
			sound("χ").overide_name("fricative_uvular_unvoiced"),
			sound("ʁ").overide_name("fricative_uvular_voiced"),
		],
		[
			sound("ħ").overide_name("fricative_pharyngeal_unvoiced"),
			sound("ʕ").overide_name("fricative_pharyngeal_voiced"),
		],
		[
			sound("h").overide_name("fricative_glotal_unvoiced"),
			sound("ɦ").overide_name("fricative_glotal_voiced"),
		],
	]
	
	var lateral_fricatives = [
		[null, null],
		[null, null],
		[null, null],
		[
			sound("ɬ").overide_name("fricative_lateral_alveolar_unvoiced"),
			sound("ɮ").overide_name("fricative_lateral_alveolar_voiced")
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
			sound("w").overide_name("approximant_labialvelar"),
		],
		[
			null,
			sound("ʋ").overide_name("approximant_labiodental"),
		],
		[null, null],
		[
			null,
			sound("ɹ").overide_name("approximant_alveolar"),
		],
		[null, null],
		[
			null,
			sound("ɻ").overide_name("approximant_retroflex"),
		],
		[
			null,
			sound("j").overide_name("approximant_palatal"),
		],
		[
			null,
			sound("ɰ").overide_name("approximant_velar"),
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
			sound("l").overide_name("approximant_lateral_alveolar"),
		],
		[null, null],
		[
			null,
			sound("ɭ").overide_name("approximant_lateral_retroflex"),
		],
		[
			null,
			sound("ʎ").overide_name("approximant_lateral_palatal"),
		],
		[
			null,
			sound("ʟ").overide_name("approximant_lateral_velar"),
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
