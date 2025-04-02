extends StaticBody2D

signal score(value:int)
@export var value : int

var color : Array = [
	Color.SEASHELL,
	Color.CHARTREUSE,
	Color.CADET_BLUE,
	Color.DODGER_BLUE,
	Color.GOLDENROD,
	Color.MAROON
]

func _ready() -> void:
	$Polygon2D.color = color[value % len(color)]
	#owner may not be set if instenated
	#score.connect(owner._on_score)
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	score.emit(100)
	value -= 1
	$Polygon2D.color = color[value % len(color)]
	if value <= 0:
		queue_free()
	pass # Replace with function body.
