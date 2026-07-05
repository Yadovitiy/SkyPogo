extends Node3D

signal new_platform(platform_pos: Vector3)



const WAIT_TIME:float = 5.0
const WAIT_TIME_VAR:float = 1.5
 



@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var player_detector: Area3D = $PlayerDetector






# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = WAIT_TIME
	timer.wait_time += randf_range(-WAIT_TIME_VAR, WAIT_TIME)
	print(timer.wait_time)


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
		new_platform.emit(position)
		
		
