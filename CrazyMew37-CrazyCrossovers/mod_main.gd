extends Node

const MOD_DIR := "CrazyMew37-CrazyCrossovers"
const LOG_NAME := "CrazyMew37-CrazyCrossovers:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""


func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
	# Add extensions
	install_script_extensions()
	install_script_hook_files()

	# Add translations
	add_translations()

	#add "global class"
	_add_global_class()

func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")

func install_script_hook_files() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")
	print("installing script hooks")
	ModLoaderMod.install_script_hooks("res://objects/globals/save_file_service.gd", extensions_dir_path.path_join("objects/globals/save_file_service.hooks.gd"))
	ModLoaderMod.install_script_hooks("res://objects/player/player.gd", extensions_dir_path.path_join("objects/player/player.hooks.gd"))
	ModLoaderMod.install_script_hooks("res://objects/battle/battle_resources/status_effects/stat_boost.gd", extensions_dir_path.path_join("objects/battle/battle_resources/status_effects/stat_boost.hooks.gd"))

func add_translations() -> void:
	translations_dir_path = mod_dir_path.path_join("translations")

func _add_global_class():
	var global_instance = load("res://mods-unpacked/CrazyMew37-CrazyCrossovers/CCglobal.gd").new()
	global_instance.name = "CCglobal"
	add_child(global_instance)

func _ready() -> void:
	Globals.ADDITIONAL_TOON_PATHS.append("res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/player/character/quacksane_teto.tres")
	Globals.ADDITIONAL_TOON_PATHS.append("res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/player/character/jerry_fitzgerbil.tres")
	print("crazy crossovers ACTIVATED!!!!!!!!!!!!!!!")

	var item_paths := {
		# Accessories - cm37
		"yoylecake": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/yoylecake.tres",
		"sodaroni": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/sodaroni.tres",
		"sun": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/sun.tres",
		"krabby_patty": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/krabby_patty.tres",
		"gold_ring": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/gold_ring.tres",
		"mushroom": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/mushroom.tres",
		"egg": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/egg.tres",
		"tnt_block": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/tnt_block.tres",
		# Pocket Pranks - cm37
		"freddy_mask": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/freddy_mask.tres",
		"chaos_emerald": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/chaos_emerald.tres",
		"exotic_butters": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/exotic_butters.tres",
		"leek": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/leek.tres",
		"poke_ball": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/poke_ball.tres",
		"great_ball": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/great_ball.tres",
		"ultra_ball": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/ultra_ball.tres",
		"master_ball": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/master_ball.tres",
	}

	var pool_memberships := {
		"stranger_items.tres": ["sun","freddy_mask","chaos_emerald","ultra_ball","master_ball",],
		"special_items.tres": ["sun","gold_ring","egg","chaos_emerald","exotic_butters","master_ball",],
		"shop_rewards.tres": ["yoylecake","sodaroni","krabby_patty","exotic_butters","leek","poke_ball","great_ball",],
		"shop_progressives.tres": [],
		"rewards.tres": ["yoylecake","sodaroni","freddy_mask","krabby_patty","mushroom","tnt_block","leek","poke_ball","great_ball","ultra_ball",],
		"progressives.tres": [],
		"floor_clears.tres": ["mushroom","egg",],
		"everything.tres": ["yoylecake","sodaroni","sun","freddy_mask","krabby_patty","gold_ring","mushroom","egg","tnt_block","chaos_emerald","exotic_butters","leek","poke_ball","great_ball","ultra_ball","master_ball",],
		"doodle_treasure.tres": ["sodaroni","tnt_block",],
		"battle_clears.tres": [],
		"active_items.tres": ["freddy_mask","chaos_emerald","exotic_butters","leek","poke_ball","great_ball","ultra_ball","master_ball",],
		"accessories.tres": ["yoylecake","sodaroni","sun","krabby_patty","gold_ring","mushroom","egg","tnt_block",],
	}

	for pool_name in pool_memberships:
		var pool: Object = ItemService.pool_from_path("res://objects/items/pools/%s" % pool_name)
		if not pool:
			push_error("Missing pool: %s" % pool_name)

		for item_name in pool_memberships[pool_name]:
			var item_path = item_paths.get(item_name, "")
			if item_path and item_path not in pool.items:
				pool.items.append(item_path)
				var item = load(item_path)
				if item:
					print("Added %s to %s" % [item.item_name, pool_name])
				else:
					push_error("Failed to load item at: %s" % item_path)
