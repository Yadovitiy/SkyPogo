extends Node3D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var player_detector: Area3D = $PlayerDetector






# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	anim_player.play('vanish' )
	
 


func _on_animation_finished(anim_name: StringName) -> void:
	queue_free()
	



func _on_player_detector_body_entered(body: Node3D) -> void:
	if body is Player:
		player_detector.body_entered.disconnect(_on_player_detector_body_entered)
		print("Timer start")
		timer.start()
		
