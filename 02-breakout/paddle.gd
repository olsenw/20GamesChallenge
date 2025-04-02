extends CharacterBody2D

@export var lateralSpeed : int = 100

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Right"):
		position.x += lateralSpeed * delta
	if Input.is_action_pressed("Left"):
		position.x -= lateralSpeed * delta
	pass
