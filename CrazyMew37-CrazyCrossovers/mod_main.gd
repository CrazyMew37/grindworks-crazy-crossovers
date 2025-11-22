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
	ModLoaderMod.install_script_hooks("res://objects/battle/battle_resources/status_effects/stat_boost.gd", extensions_dir_path.path_join("objects/battle/battle_resources/status_effects/stat_boost.hooks.gd"))
	ModLoaderMod.install_script_hooks("res://objects/player/player.gd", extensions_dir_path.path_join("objects/player/player.hooks.gd"))
	ModLoaderMod.install_script_hooks("res://objects/battle/battle_resources/toon_attacks/gag_squirt.gd", extensions_dir_path.path_join("objects/battle/battle_resources/toon_attacks/gag_squirt.hooks.gd"))
	ModLoaderMod.install_script_hooks("res://objects/battle/battle_resources/toon_attacks/gag_sound.gd", extensions_dir_path.path_join("objects/battle/battle_resources/toon_attacks/gag_sound.hooks.gd"))
	ModLoaderMod.install_script_hooks("res://objects/battle/battle_resources/toon_attacks/gag_throw.gd", extensions_dir_path.path_join("objects/battle/battle_resources/toon_attacks/gag_throw.hooks.gd"))

func add_translations() -> void:
	translations_dir_path = mod_dir_path.path_join("translations")

func _add_global_class():
	var global_instance = load("res://mods-unpacked/CrazyMew37-CrazyCrossovers/CCglobal.gd").new()
	global_instance.name = "CCglobal"
	add_child(global_instance)

func _ready() -> void:
	Globals.ADDITIONAL_TOON_PATHS.append("res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/player/character/quacksane_teto.tres")
	Globals.ADDITIONAL_TOON_PATHS.append("res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/player/character/jerry_fitzgerbil.tres")
	Globals.ADDITIONAL_TOON_PATHS.append("res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/player/character/cartooncle.tres")
	Globals.ADDITIONAL_TOON_PATHS.append("res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/player/character/the_blue_blur.tres")
	
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
		"bubble_blower": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/bubble_blower.tres",
		"snowball": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/snowball.tres",
		"electric_guitar": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/electric_guitar.tres",
		"fire_flower": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/fire_flower.tres",
		"never-melt_ice": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/never-melt_ice.tres",
		"fork": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/fork.tres",
		"green_puyo": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/green_puyo.tres",
		"blue_puyo": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/blue_puyo.tres",
		"purple_puyo": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/purple_puyo.tres",
		"red_puyo": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/red_puyo.tres",
		"yellow_puyo": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/yellow_puyo.tres",
		"garbage_puyo": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/passive/garbage_puyo.tres",
		# Pocket Pranks - cm37
		"freddy_mask": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/freddy_mask.tres",
		"chaos_emerald": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/chaos_emerald.tres",
		"exotic_butters": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/exotic_butters.tres",
		"leek": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/leek.tres",
		"poke_ball": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/poke_ball.tres",
		"great_ball": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/great_ball.tres",
		"ultra_ball": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/ultra_ball.tres",
		"master_ball": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/master_ball.tres",
		"super_star": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/super_star.tres",
		"potion": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/potion.tres",
		"super_potion": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/super_potion.tres",
		"hyper_potion": "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/items/resources/active/hyper_potion.tres",
	}

	var pool_memberships := {
		"stranger_items.tres": ["sun","freddy_mask","chaos_emerald","ultra_ball","master_ball","bubble_blower","electric_guitar","fire_flower","fork","super_star","garbage_puyo",],
		"special_items.tres": ["sun","gold_ring","egg","chaos_emerald","exotic_butters","master_ball","fork","super_star",],
		"shop_rewards.tres": ["yoylecake","sodaroni","krabby_patty","exotic_butters","leek","poke_ball","great_ball","fire_flower",],
		"shop_progressives.tres": ["potion","super_potion","hyper_potion",],
		"rewards.tres": ["yoylecake","sodaroni","freddy_mask","krabby_patty","mushroom","tnt_block","leek","poke_ball","great_ball","ultra_ball","bubble_blower","snowball","never-melt_ice","green_puyo","blue_puyo","purple_puyo","red_puyo","yellow_puyo","hyper_potion",],
		"progressives.tres": ["potion","super_potion",],
		"item_roll_fails.tres": ["potion","super_potion","hyper_potion",],
		"floor_clears.tres": ["mushroom","egg","electric_guitar","green_puyo","blue_puyo","purple_puyo","red_puyo","yellow_puyo","garbage_puyo",],
		"everything.tres": ["yoylecake","sodaroni","sun","freddy_mask","krabby_patty","gold_ring","mushroom","egg","tnt_block","chaos_emerald","exotic_butters","leek","poke_ball","great_ball","ultra_ball","master_ball","bubble_blower","snowball","electric_guitar","fire_flower","never-melt_ice","fork","super_star","green_puyo","blue_puyo","purple_puyo","red_puyo","yellow_puyo","garbage_puyo","potion","super_potion","hyper_potion",],
		"doodle_treasure.tres": ["sodaroni","tnt_block","potion","super_potion","hyper_potion",],
		"battle_clears.tres": ["potion",],
		"active_items.tres": ["freddy_mask","chaos_emerald","exotic_butters","leek","poke_ball","great_ball","ultra_ball","master_ball","super_star","potion","super_potion","hyper_potion",],
		"accessories.tres": ["yoylecake","sodaroni","sun","krabby_patty","gold_ring","mushroom","egg","tnt_block","bubble_blower","snowball","electric_guitar","fire_flower","never-melt_ice","fork","green_puyo","blue_puyo","purple_puyo","red_puyo","yellow_puyo","garbage_puyo",],
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
					
	Util.s_floor_started.connect(load_boss_rooms)
	
var add_boss_rooms = true

# Add the crossover boss rooms here, you idiot. -cm37
# The Mint is mint_floor_variant, DA Office, is da_floor_variant, and CGC is cgc_floor variant. -cm37
func load_boss_rooms(_game_floor: GameFloor) -> void:
	if add_boss_rooms == true:
		var miku_boss_room := FacilityRoom.new()
		miku_boss_room.room = "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/modules/factory/miku_boss_room.tscn"
		miku_boss_room.rarity_weight = 0.5
		Globals.factory_floor_variant.floor_type.final_rooms.append(miku_boss_room)
		
		var krabs_boss_room := FacilityRoom.new()
		krabs_boss_room.room = "res://mods-unpacked/CrazyMew37-CrazyCrossovers/extensions/objects/modules/mint/mr_krabs_boss.tscn"
		krabs_boss_room.rarity_weight = 0.5
		Globals.mint_floor_variant.floor_type.final_rooms.append(krabs_boss_room)
		
		print("cc boss rooms added")
		add_boss_rooms = false
