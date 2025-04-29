extends Control

@export var selection_container : HFlowContainer
var selections : Array[int] = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in selection_container.get_children():
		child.added.connect(_on_selection_added)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_selection_added(id):
	selections.append(id)
	print(selections)
