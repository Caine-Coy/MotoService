extends Node3D
#WholeSale
#Per Litre
@export var petrolPrice : float
#Per Litre
@export var dieselPrice : float
#Per KWh
@export var electricityPrice : float

signal world_values_updated

func ready():
	pass

func updatePrices():
	world_values_updated.emit()

func _on_property_list_changed():
	updatePrices()
