@abstract class_name BasicKey extends Button


func input_event_with_modifiert_to_string(input_event : InputEventWithModifiers) -> String:
	var hint := OS.get_keycode_string(input_event.keycode).to_lower()
	if input_event.shift_pressed:
		hint = "⇧%s" % hint.to_upper()
	if input_event.alt_pressed:
		hint = "⌥%s" % hint
	if input_event.ctrl_pressed:
		hint = "⌃%s" % hint
	return hint
