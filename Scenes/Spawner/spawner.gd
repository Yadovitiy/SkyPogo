extends Node





@export var platform_scene: PackedScene


func spawn_platform(old_platform_pos: Vector3) -> void:
	var new_platform: Platform = platform_scene.instantiate()
	new_platform.position = old_platform_pos + Vector3(2, 5, -2)
	
	add_child(new_platform)
	
	
	



func _on_new_platform(platform_pos: Vector3) -> void:
	spawn_platform(platform_pos)
	
	
