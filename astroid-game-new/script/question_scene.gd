extends Control
@onready var labelA = $VBoxContainer/HBoxContainer/LabelA
@onready var labelB = $VBoxContainer/HBoxContainer2/LabelB
@onready var labelC = $VBoxContainer/HBoxContainer3/LabelC
@onready var labelD = $VBoxContainer/HBoxContainer4/LabelD

var grade12 = ["What happens at a black hole’s event horizon?", "What causes stellar parallax?", "What causes Doppler shift in galaxies?", "Which EM wave has the shortest wavelength?", "What does an astronomical unit measure?", "What forms a neutron star?", "Why use spectroscopy?", 
"What happens to space-time near massive objects?", "What mainly affects a planet’s surface temperature?", "Why is dark matter important?" ]
var grade12ans = {
	"What happens at a black hole’s event horizon?" : ["Gravity disappears", "Time stops everywhere", "Light cannot escape", "Stars form"]
	
}
var answer_picked = false
var question_picked = false
var choices = []

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	randomize()
	choices = grade12ans["What happens at a black hole’s event horizon?"]
	print(choices[0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# use dictionaries and arrays for question randomization. use an array to store and to randomize picking questions,
# then use the picked question as a key in a dictionary to get the values of an array of the choices
