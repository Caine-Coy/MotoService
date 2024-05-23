extends Node3D

@export var fuelLevel : int
@export var fuelType : FuelType
@onready var worldController : Node3D = %WorldController
var petrolPrice : float
#Per Litre
var dieselPrice : float
#Per KWh
var electricityPrice : float

enum FuelType{
	PETROL,
	DIESEL,
	ELECTRIC,
}

func _ready():
	worldController.world_values_updated.connect(world_values_updated)
	

func _process(delta):
	pass

func world_values_updated():
	petrolPrice = worldController.petrolPrice
	dieselPrice = worldController.dieselPrice
	electricityPrice = worldController.electricityPrice


func _on_hit_box_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print(petrolPrice)
