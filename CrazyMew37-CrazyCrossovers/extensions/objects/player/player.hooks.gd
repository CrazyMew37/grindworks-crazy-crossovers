extends Object

func reset_stats(chain: ModLoaderHookChain) -> void:
	chain.execute_next()
	var owner_node = chain.reference_object as Node
	if owner_node == null:
		print("Hook error: reference_object is not a Node.")
		return

	var gf_path = "/root/ModLoader/CrazyMew37-CrazyCrossovers/CCglobal"
	
	# Try to directly get the GFglobal node
	var gf = owner_node.get_node_or_null(gf_path)
	
	if gf:
		gf.reset_stats()
		print("CCglobal stats reset.")
	else:
		print("CCglobal not found at", gf_path)
