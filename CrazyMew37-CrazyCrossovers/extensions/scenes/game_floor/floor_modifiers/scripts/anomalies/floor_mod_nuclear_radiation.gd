extends FloorModifier

var BOOST_STATS :={
	'damage': RNG.channel(RNG.ChannelToughCrowdMod).randf_range(-0.2,0.2),
	'defense': RNG.channel(RNG.ChannelToughCrowdMod).randf_range(-0.2,0.2),
	'evasiveness': RNG.channel(RNG.ChannelToughCrowdMod).randf_range(-0.2,0.2),
	'luck': RNG.channel(RNG.ChannelToughCrowdMod).randf_range(-0.2,0.2),
	'speed': RNG.channel(RNG.ChannelToughCrowdMod).randf_range(-0.2,0.2),
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
	return "Nuclear Radiation"

func get_mod_quality() -> ModType:
	return ModType.NEUTRAL

func get_mod_icon() -> Texture2D:
	return load("res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/ui_assets/player_ui/pause/nuclearradiation.png")

func get_description() -> String:
	return "Your stats are multiplied randomly (either positively or negatively) for the floor."
