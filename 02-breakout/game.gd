extends Node2D

@export var score: int
@export var brick_scene: PackedScene

func _ready() -> void:
	$Label.text = str(score)
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
	$Label.text = str(score)
	pass

func _on_detect_leave_area_entered(area: Area2D) -> void:
	# detect if ball is out of bounds
	pass # Replace with function body.
