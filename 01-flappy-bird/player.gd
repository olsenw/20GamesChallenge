extends RigidBody2D

signal hit

@export var jump := -1000
var jumping : bool = false
var reset_request : bool = false

var origin_transform : Transform2D
var origin_velocity

func _ready() -> void:
	origin_transform = transform
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		jumping = true
	elif event.is_action_pressed("reset"):
		set_freeze_mode(RigidBody2D.FREEZE_MODE_KINEMATIC)
		reset_request = true
	pass

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var velocity := state.get_linear_velocity()
	var step := state.get_step()
	if jumping:
		jumping = false
		velocity.y = jump
	if reset_request:
		reset_request = false
		state.transform = origin_transform
		velocity = Vector2.ZERO
	velocity += state.get_total_gravity() * step
	state.set_linear_velocity(velocity)
	pass


func _on_hit() -> void:
	set_freeze_mode(RigidBody2D.FREEZE_MODE_STATIC)
	pass # Replace with function body.
