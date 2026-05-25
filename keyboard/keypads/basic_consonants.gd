extends BasicKeyPad

func _ready() -> void:
	var plosives = [
		[
			sound("p"),
			sound("b"),
		],
		[null, null],
		[null, null],
		[
			sound("t"),
			sound("d"),
		],
		[null, null],
		[
			sound("ʈ").overide_name("t_retroflex"),
			sound("ɖ").overide_name("d_retroflex"),
		],
		[
			sound("c"),
			sound("ɟ").overide_name("j_plosive"),
		],
		[
			sound("k"),
			sound("g")
		],
		[
			sound("q"),
			sound("ɢ").overide_name("g_uvular")
		],
		[null, null],
		[
			sound("ʔ").overide_name("glottal_stop"),
			null
		],
	]
	
	var nasals = [
		[
			null,
			sound("m")
		],
		[
			null,
			sound("ɱ").overide_name("m_labiodental")
		],
		[null, null],
		[null, null],
		[
			null,
			sound("n")
		],
		[
			null,
			sound("ɳ").overide_name("n_retroflex")
		],
		[
			null,
			sound("ɲ").overide_name("n_palatal")
		],
		[
			null,
			sound("ŋ").overide_name("n_velar")
		],
		[
			null,
			sound("ɴ").overide_name("n_uvular")
		],
		[null, null],
		[null, null],
	]
	
	var trills = [
		[null, sound("ʙ").overide_name("b_trill")],
		[null, null],
		[null, null],
		[null, sound("r").overide_name("r_trill_aveolar")],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, sound("ʀ").overide_name("r_trill_uvular")],
		[null, null],
		[null, null],
	]
	
	var taps = [
		[null, null],
		[null, sound("ⱱ").overide_name("v_tap")],
		[null, null],
		[null, sound("ɾ").overide_name("r_tap")],
		[null, null],
		[null, sound("ɽ").overide_name("r_tap_retroflex")],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
		[null, null],
	]
	
	var fricatives = [
		[
			sound("ɸ").overide_name("p_fricative"),
			sound("β").overide_name("b_fricative"),
		],
		[
			sound("f"),
			sound("v")
		],
		[
			sound("θ").overide_name("t_fricative"),
			sound("ð").overide_name("d_fricative"),
		],
		[
			sound("s"),
			sound("z")
		],
		[
			sound("ʃ").overide_name("s_postaveolar"),
			sound("ʒ").overide_name("z_postaveolar"),
		],
		[
			sound("ʂ").overide_name("s_retroflex"),
			sound("ʐ").overide_name("z_retroflex"),
		],
		[
			sound("ç").overide_name("c_fricative"),
			sound("ʝ").overide_name("j_fricative"),
		],
		[
			sound("x"),
			sound("ɣ").overide_name("x_voiced")
		],
		[
			sound("χ").overide_name("x_uvular"),
			sound("ʁ").overide_name("r_uvular"),
		],
		[
			sound("ħ").overide_name("h_1"),
			sound("ʕ").overide_name("h_2"),
		],
		[
			sound("h").overide_name("h_3"),
			sound("ɦ").overide_name("h_4"),
		],
	]
	
	var lateral_fricatives = [
		[null, null],
		[null, null],
		[null, null],
		[
			sound("ɬ").overide_name("s_lateral"),
			sound("ɮ").overide_name("z_lateral")
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
		[null, null],
		[
			null,
			sound("ʋ").overide_name("v_approx"),
		],
		[null, null],
		[
			null,
			sound("ɹ").overide_name("r_approx")
		],
		[null, null],
		[
			null,
			sound("ɻ").overide_name("r_approx_retroflex")
		],
		[
			null,
			sound("j")
		],
		[
			null,
			sound("ɰ").overide_name("g_approximant")
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
			sound("l").overide_name("l_1"),
		],
		[null, null],
		[
			null,
			sound("ɭ").overide_name("l_2"),
		],
		[
			null,
			sound("ʎ").overide_name("l_3"),
		],
		[
			null,
			sound("ʟ").overide_name("l_4"),
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
