extends Control

@export var speed: float = 5.0

@onready var outer_bar: ColorRect = $OuterBar
@onready var moving_bar: ColorRect = $OuterBar/MovingBar
@onready var redzone: ColorRect = $OuterBar/RedZone
@onready var redzone2: ColorRect = $OuterBar/RedZone2
@onready var yellowzone: ColorRect = $OuterBar/YellowZone
@onready var yellowzone2: ColorRect = $OuterBar/YellowZone2
@onready var greenzone: ColorRect = $OuterBar/GreenZone

@onready var label: Label = $Label

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

func _on_button_pressed() -> void:
	if (moving_bar.position.x >= redzone.position.x && moving_bar.position.x <= redzone.position.x + redzone.size.x) || (moving_bar.position.x >= redzone2.position.x && moving_bar.position.x <= redzone2.position.x + redzone2.size.x):
		label.text = "RED"
		print("RED")
	elif (moving_bar.position.x > yellowzone.position.x && moving_bar.position.x <= yellowzone.position.x + yellowzone.size.x )|| (moving_bar.position.x >= yellowzone2.position.x && moving_bar.position.x <= yellowzone2.position.x + yellowzone2.size.x):
		label.text = "YELLOW"
		print("YELLOW")
	elif (moving_bar.position.x > greenzone.position.x && moving_bar.position.x <=greenzone.position.x + greenzone.size.x):
		label.text= "GREEN"
		print("GREEN")
