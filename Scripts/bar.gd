extends Control

@export var speed: float = 5.0

@onready var outer_bar: ColorRect = $OuterBar
@onready var moving_bar: ColorRect = $OuterBar/MovingBar

var time: float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time+= delta * speed
	
	#this is the maximum x range that the moving bar can move within
	var range_x: float = outer_bar.size.x - moving_bar.size.x
	
	# basically calculating using a sin wave distance x
	# sin wave gonna give us -1 or 1
	# so we do sin(time) + 1 so that we have 0 or 2 as range
	# the 0.5 is there so that the range is 0 to 1
	var x: float = (sin(time) + 1.0) * 0.5 * range_x
	
	# move the bar accordin
	moving_bar.position.x = x
	moving_bar.position.y = 0
	
	pass
