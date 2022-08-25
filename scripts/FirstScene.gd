extends Spatial

var sceneLabel3D = preload("res://scenes/Label3D.tscn")

var sceneNode2DLabel = preload("res://scenes/Node2DLabel.tscn")

var sceneSpatialLabel3D = preload("res://scenes/SpatialLabel3D.tscn")

# Action = instance very large amount of different scene combinations:

# Instanced Scene = Node2D with Label child
# Expected = game stops responding
# Actual = game stops responding

# Instanced Scene = Spatial with Label3D child
# Expected = game stops responding
# Actual = game disappears entirely, editor stays open

#   "    = produces following error message on Event Viewer:
#Faulting application name: godot.windows.opt.tools.64.exe, version: 3.5.0.0, time stamp: 0x00000000
#Faulting module name: godot.windows.opt.tools.64.exe, version: 3.5.0.0, time stamp: 0x00000000
#Exception code: 0xc0000005
#Fault offset: 0x0000000002e3e6e0
#Faulting process id: 0x1c54
#Faulting application start time: 0x01d8b7e5f4d8b4f8
#Faulting application path: E:\SteamLibrary\steamapps\common\Godot Engine\godot.windows.opt.tools.64.exe
#Faulting module path: E:\SteamLibrary\steamapps\common\Godot Engine\godot.windows.opt.tools.64.exe
#Report Id: dc433a8b-404a-4870-88db-af91f1a96cb6
#Faulting package full name: 
#Faulting package-relative application ID: 


# Instanced Scene = Label3D
# Expected = game stops responding
# Actual = game stops responding
# . extended notes relevant to my original problem =
# . lasts much longer before crashing behavior begins
# . in comparison to Spatial parent with Label3D child

func _ready():
	
	# the main focus is the sceneSpatialLabel3D
	# 
	
	# it disappears at 150,000, it stops responding at 1,500,000
	# it disappears at 30000, it stops responding at 300,000
	# it disappears at 15000, 12000, 11000
	# stops responding at 10500
	
	for i in 1500000:
		var instance = sceneLabel3D.instance()
		add_child(instance)
	pass
