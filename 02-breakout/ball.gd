extends RigidBody2D

@export var launchVector : Vector2 = Vector2(0,-100)
var launch : bool = false
var launchable : bool = true
var reset : bool = false
var origin : Vector2

func _ready() -> void:
	origin = position
	var circle : PackedVector2Array = []
	var radius : int = 20
	for d in range(0, 360, 10):
		var r : float = deg_to_rad(d)
		circle.append(Vector2(radius * cos(r), radius * sin(r)))
	$Polygon2D.polygon = circle
	pass

func reset_ball() -> void:
	reset = true
	launchable = true
	launch = false
	pass

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	#print_debug("ball - reset: " + str(reset) + " - launch: " + str(launch))
	if reset == true:
		reset = false
		position = origin
		linear_velocity = Vector2.ZERO
	if launch == true:
		launch = false
		linear_velocity = launchVector
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Space"):
		print_debug("ball - launch {launchable:"+str(launchable)+"}{launch:"+str(launch)+"}")
		if launchable == true:
			launchable = false
			launch = true
	pass
