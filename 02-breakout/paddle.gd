extends CharacterBody2D

@export var lateralSpeed : int = 100
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
	pass

func _physics_process(delta: float) -> void:
	position.x += lateralSpeed * delta
	pass
