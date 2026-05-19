extends FloorModifier

var BOOST_STATS :={
	'evasiveness': -0.2,
	'speed': -0.1,
}
var multipliers: Array[StatMultiplier]

func modify_floor() -> void:
	await Task.delay(0.5)
	for stat in BOOST_STATS.keys():
		var mult := StatMultiplier.new()
		mult.stat = stat
		mult.amount = BOOST_STATS[stat]
		mult.additive = false
		multipliers.append(mult)
		Util.get_player().stats.multipliers.append(mult)

func clean_up() -> void:
	for multiplier in multipliers:
		Util.get_player().stats.multipliers.erase(multiplier)

func get_mod_name() -> String:
	return "Yoyle Metal"

func get_mod_quality() -> ModType:
	return ModType.NEGATIVE

func get_mod_icon() -> Texture2D:
	return load("res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/ui_assets/player_ui/pause/yoylemetal.png")

func get_description() -> String:
	return "0.9x Speed and 0.8x Evasiveness for the floor."
