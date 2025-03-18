extends Node2D

@export var pipe_scene : PackedScene
var score : int = 0
var window : Vector2

func _ready() -> void:
	window = get_viewport_rect().size
	start_game()

func update_score() -> void:
	score += 1
	#print(score)
	$Score.text = str(score)

func start_game() -> void:
	score = 0
	$Score.text = str(score)
	$PipeTimer.start()
	$Player.reset()
	for child in $PipesHolder.get_children():
		child.queue_free()
		pass
	get_tree().paused = false
	$"Press R to restart".hide()

func end_game() -> void:
	$PipeTimer.stop()
	get_tree().paused = true
	$"Press R to restart".show()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("reset"):
		start_game()
	pass

func _on_pipe_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	pipe.position.x = window.x
	pipe.position.y = randi_range(80, 220)
	pipe.score.connect(_on_pipes_score)
	$PipesHolder.add_child(pipe)
	pass

func _on_player_hit() -> void:
	end_game()
	pass # Replace with function body.


func _on_pipes_score() -> void:
	update_score()
	#print("game - score")
	pass # Replace with function body.
