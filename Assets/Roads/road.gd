@tool

extends Node3D

@onready var path : Path3D = $"Path3D"
@onready var car : PathFollow3D = $"Path3D/Car"

func _ready():
	car.progress_ratio = 0.0

func _process(delta):
	if (car.progress_ratio < 1.0):
		car.progress_ratio += 0.001
