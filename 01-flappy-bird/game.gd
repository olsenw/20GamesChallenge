extends Node2D

@export var pipe_scene : PackedScene
var score : int = 0
var window : Vector2

func _ready() -> void:
	window = get_viewport_rect().size
	start_game()

func start_game() -> void:
	score = 0
	$PipeTimer.start()

func end_game() -> void:
	$PipeTimer.stop()

func _on_pipe_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	pipe.position.x = window.x
	pipe.position.y = randi_range(40, 560)
	add_child(pipe)
	pass
