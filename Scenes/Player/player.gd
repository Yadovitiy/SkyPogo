extends CharacterBody3D


class_name Player

const GRAVITY: float = 5.0
const JUMP_FORCE: float = 5.0
const ROTATION_SPEED: float = 4.0
const MOVE_SPEED: float = 3.5


@onready var anim_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	
func _physics_process(delta: float) -> void:
	handle_rotation(delta)
	handle_gravity(delta)
	handle_movement()
	move_and_slide()
	handle_animation()


func handle_rotation(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		rotate_y(ROTATION_SPEED * delta)
	if Input.is_action_pressed("ui_right"):
		rotate_y(-ROTATION_SPEED * delta)
		
	
	

func handle_movement() -> void:
	var dir: Vector3 = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		dir = transform.basis.z
	velocity.x = dir.x * MOVE_SPEED
	velocity.z = dir.z * MOVE_SPEED	
	
	
func handle_gravity(delta: float) -> void:
	if is_on_floor():
		velocity.y = JUMP_FORCE
	else:
		velocity.y -= GRAVITY * delta


func handle_animation() -> void:
	if velocity.y > 0:
		anim_player.play("jump")
	else:
		anim_player.play("fall")	
