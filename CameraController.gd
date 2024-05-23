extends Node3D

@export_range(0,1) var camSpeedDivisor = 0.4
@export_range(0,1) var camRotDivisor = 0.025
@export_range(0,1) var camSpeedZoomMult = 0.05
@export_range(0,1) var camZoomMult = 0.1
@export var camZoomMax = 50
@export var camZoomMin = 3
var zoomLevel

@onready var camera : Camera3D = $"Camera3D"

var parentNode
func _process(delta):
	_movement(delta)
	_uiKeys()

func _ready():
	parentNode = get_parent_node_3d()
	pass

func _movement(delta):
	var hor_dir = Input.get_vector("camera_left","camera_right","camera_forward","camera_backwards")
	var rot_dir = Input.get_axis("rotate_left","rotate_right")
	#var tilt_dir = Input.get_axis("tilt_up","tilt_down")
	translate(Vector3(hor_dir.x,0,(hor_dir.y)*camSpeedDivisor)*(camera.position.z*camSpeedZoomMult))
	rotate(Vector3(0,1,0),rot_dir*camRotDivisor)

func _uiKeys():
	pass

func _input(event):
	#Zoom
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP && camera.position.z > camZoomMin:
			camera.translate_object_local(Vector3(0,0,-1)*camera.position.z*camZoomMult)
			zoomLevel = int(camera.position.z)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN && camera.position.z < camZoomMax:
			camera.translate_object_local(Vector3(0,0,1)*camera.position.z*camZoomMult)
			zoomLevel = int(camera.position.z)
