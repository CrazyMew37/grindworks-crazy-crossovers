extends FloorModifier

var floor_mod = 0.5

func modify_floor() -> void:
	await Task.delay(0.5)
	if Util.floor_number > 5:
		floor_mod = 0.5 * (1 + (floor((Util.floor_number - 1) / 5) * 0.5))
	Util.get_player().stats.crit_mult += floor_mod

func clean_up() -> void:
	Util.get_player().stats.crit_mult -= floor_mod

func get_mod_name() -> String:
	return "Mighty Crits"

func get_mod_quality() -> ModType:
	return ModType.POSITIVE

func get_mod_icon() -> Texture2D:
	return load("res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/ui_assets/player_ui/pause/mightycrits.png")

func get_description() -> String:
	return "Crit Mult is boosted by +50% for the floor! (Increases by +25% every 5 floors)"
