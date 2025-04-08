extends Node2D

@export var lives: int
@export var score: int
@export var brick_scene: PackedScene

func _ready() -> void:
	$LivesLabel.text = str(lives)
	$ScoreLabel.text = str(score)
	for row in range(5):
		for col in range(5):
			var brick = brick_scene.instantiate()
			brick.score.connect(_on_score)
			brick.set_position(Vector2(200+col*62,200+row*22))
			brick.value = 5-row
			$BrickCollection.add_child(brick)
	pass

func _on_score(value:int) -> void:
	score += value
	$ScoreLabel.text = str(score)
	pass

func _on_detect_leave_body_entered(body: Node2D) -> void:
	lives -= 1
	$LivesLabel.text = str(lives)
	if lives > 0:
		$Ball.reset_ball()
	else:
		$GameOverLabel.visible = true
	pass # Replace with function body.
