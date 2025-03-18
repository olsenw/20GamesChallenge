extends Node2D

signal score

func _ready() -> void:
	#print(position)
	pass

func _physics_process(delta: float) -> void:
	$ScoreZone.position.x = $UpperPipe.position.x

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass


func _on_score_zone_body_entered(body: Node) -> void:
	score.emit()
	#print("pipes - score")
	pass # Replace with function body.
