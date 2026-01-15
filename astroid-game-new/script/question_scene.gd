extends Control
signal correct

@onready var labelA = $VBoxContainer/HBoxContainer/LabelA
@onready var labelB = $VBoxContainer/HBoxContainer2/LabelB
@onready var labelC = $VBoxContainer/HBoxContainer3/LabelC
@onready var labelD = $VBoxContainer/HBoxContainer4/LabelD
@onready var question_label = $Label
var grade12 = [
	{
		"question": "What happens at a black hole’s event horizon?",
		"options": [
			"Gravity disappears",
			"Time stops everywhere",
			"Light cannot escape",
			"Stars form"
		],
		"correct_answer": "Light cannot escape"
	},
	{
		"question": "What causes stellar parallax?",
		"options": [
			"Doppler shift",
			"Earth’s orbit",
			"Star motion",
			"Gravity waves"
		],
		"correct_answer": "Earth’s orbit"
	},
	{
		"question": "What causes Doppler shift in galaxies?",
		"options": [
			"Gravity",
			"Atmospheric refraction",
			"Relative motion",
			"Earth’s rotation"
		],
		"correct_answer": "Relative motion"
	},
	{
		"question": "Which EM wave has the shortest wavelength?",
		"options": [
			"Radio",
			"Infrared",
			"Visible",
			"Gamma"
		],
		"correct_answer": "Gamma"
	},
	{
		"question": "What does an astronomical unit measure?",
		"options": [
			"Distance between galaxies",
			"Earth–Sun distance",
			"Star size",
			"Light travel time"
		],
		"correct_answer": "Earth–Sun distance"
	},
	{
		"question": "What forms a neutron star?",
		"options": [
			"Asteroid collision",
			"White dwarf cooling",
			"Massive star explosion",
			"Red giant expansion"
		],
		"correct_answer": "Massive star explosion"
	},
	{
		"question": "Why use spectroscopy?",
		"options": [
			"Magnification",
			"Orbit tracking",
			"Composition and motion",
			"Gravity calculation"
		],
		"correct_answer": "Composition and motion"
	},
	{
		"question": "What happens to space-time near massive objects?",
		"options": [
			"Flattens",
			"Freezes",
			"Curves",
			"Breaks"
		],
		"correct_answer": "Curves"
	},
	{
		"question": "What mainly affects a planet’s surface temperature?",
		"options": [
			"Moons",
			"Shape",
			"Distance & atmosphere",
			"Rotation speed"
		],
		"correct_answer": "Distance & atmosphere"
	},
	{
		"question": "Why is dark matter important?",
		"options": [
			"Emits light",
			"Adds gravity",
			"Heats galaxies",
			"Creates stars"
		],
		"correct_answer": "Adds gravity"
	}
]
var grade11 = [
	{
		"question": "Which layer of the Sun is visible?",
		"options": [
			"Core",
			"Radiative zone",
			"Photosphere",
			"Corona"
		],
		"correct_answer": "Photosphere"
	},
	{
		"question": "What supports the Big Bang theory?",
		"options": [
			"Moon phases",
			"Cosmic microwave background",
			"Planet rotation",
			"Magnetic fields"
		],
		"correct_answer": "Cosmic microwave background"
	},
	{
		"question": "Why is escape velocity important?",
		"options": [
			"Star brightness",
			"Orbital speed",
			"Leaving gravitational pull",
			"Tides"
		],
		"correct_answer": "Leaving gravitational pull"
	},
	{
		"question": "Why can’t black holes be seen directly?",
		"options": [
			"Too far away",
			"Emit no light",
			"Don’t exist",
			"Absorb planets"
		],
		"correct_answer": "Emit no light"
	},
	{
		"question": "Which waves study cold gas clouds?",
		"options": [
			"Gamma",
			"X-ray",
			"Ultraviolet",
			"Radio"
		],
		"correct_answer": "Radio"
	},
	{
		"question": "Why does Mercury lack an atmosphere?",
		"options": [
			"Too dense",
			"Far from Sun",
			"Low gravity",
			"Too many craters"
		],
		"correct_answer": "Low gravity"
	},
	{
		"question": "Why is Hubble above Earth’s atmosphere?",
		"options": [
			"Less gravity",
			"Avoid distortion",
			"Closer to stars",
			"Capture energy"
		],
		"correct_answer": "Avoid distortion"
	},
	{
		"question": "How do stars produce energy?",
		"options": [
			"Burning oxygen",
			"Nuclear fusion",
			"Radioactive decay",
			"Splitting atoms"
		],
		"correct_answer": "Nuclear fusion"
	},
	{
		"question": "What tool studies non-visible light?",
		"options": [
			"Optical microscope",
			"Radio telescope",
			"Magnifying lens",
			"Binoculars"
		],
		"correct_answer": "Radio telescope"
	},
	{
		"question": "Which radiation observes supernova remnants?",
		"options": [
			"Radio",
			"Infrared",
			"X-ray",
			"Microwave"
		],
		"correct_answer": "X-ray"
	}
]
#var grade12 = ["What happens at a black hole’s event horizon?", "What causes stellar parallax?", "What causes Doppler shift in galaxies?", "Which EM wave has the shortest wavelength?", "What does an astronomical unit measure?", "What forms a neutron star?", "Why use spectroscopy?", 
#"What happens to space-time near massive objects?", "What mainly affects a planet’s surface temperature?", "Why is dark matter important?" ]

#var grade11 = [
  #"Which layer of the Sun is visible?",
  #"What supports the Big Bang theory?",
  #"Why is escape velocity important?",
  #"Why can’t black holes be seen directly?",
  #"Which waves study cold gas clouds?",
  #"Why does Mercury lack an atmosphere?",
  #"Why is Hubble above Earth’s atmosphere?",
  #"How do stars produce energy?",
  #"What tool studies non-visible light?",
  #"Which radiation observes supernova remnants?"
#]

#var grade11choices = {
	#"WWhich layer of the Sun is visible?" : ["Core", "Radiative zone", "Photosphere", "Corona"],
	#"What supports the Big Bang theory?" : ["Moon phases", "Cosmic microwave background", "Planet rotation", "Magnetic fields"],
	#"Why is escape velocity important?" : ["Star brightness", "Orbital speed", "Leaving gravitational pull", "Tides"],
	#"Why can’t black holes be seen directly?" : ["Too far away", "Emit no light", "Don’t exist", "Absorb planets"],
	#"Which waves study cold gas clouds?" : ["Gamma", "X-ray", "Ultraviolet", "Radio"],
	#"Why does Mercury lack an atmosphere?" : ["Too dense", "Far from Sun", "Low gravity", "Too many craters"],
	#"Why is Hubble above Earth’s atmosphere?" : ["Less gravity", "Avoid distortion", "Closer to stars", "Capture energy"],
	#"How do stars produce energy?" : ["Burning oxygen", "Nuclear fusion", "Radioactive decay", "Splitting atoms"],
	#"What tool studies non-visible light?" : ["Optical microscope", "Radio telescope", "Magnifying lens", "Binoculars"],
	#"Which radiation observes supernova remnants?" : ["Radio", "Infrared", "X-ray", "Microwave"]
	
#}
var answer_picked = false
var question_picked = false
var correct_answer
var grade_level
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.generate == true:
		Global.generate = false
		pick()
# use dictionaries and arrays for question randomization. use an array to store and to randomize picking questions,
# then use the picked question as a key in a dictionary to get the values of an array of the choices
func questionpicker(index):
	
	randomize()
	question_picked = true
	answer_picked = false
	var gradelevel = grade_level[index]
	var question = gradelevel["question"]
	var choices = gradelevel["options"]
	correct_answer = gradelevel["correct_answer"]
	
	choices.shuffle()
	question_label.text = str(question)
	labelA.text = choices[0]
	labelB.text = choices[1]
	labelC.text = choices[2]
	labelD.text = choices[3]


func _on_a_pressed() -> void:
	if labelA.text == str(correct_answer) and answer_picked == false:
		print("CORRECT ANSWER")
		answer_picked = true
		question_picked = false
		emit_signal("correct")
		visible = false
		questionpicker(randi_range(0, grade_level.size() - 1))
		
func _on_b_pressed() -> void:
	if labelB.text == str(correct_answer) and answer_picked == false:
		print("CORRECT ANSWER")
		answer_picked = true
		question_picked = false
		emit_signal("correct")
		visible = false
		questionpicker(randi_range(0, grade_level.size() - 1))
		
func _on_c_pressed() -> void:
	if labelC.text == str(correct_answer) and answer_picked == false:
		print("CORRECT ANSWER")
		answer_picked = true
		question_picked = false
		emit_signal("correct")
		visible = false
		questionpicker(randi_range(0, grade_level.size() - 1))
		
func _on_d_pressed() -> void:
	if labelD.text == str(correct_answer) and answer_picked == false:
		print("CORRECT ANSWER")
		answer_picked = true
		question_picked = false
		emit_signal("correct")
		visible = false
		questionpicker(randi_range(0, grade_level.size() - 1))

func pick():
	match Global.grade:
		12:
			grade_level = grade12
		11:
			grade_level = grade11
	questionpicker(randi_range(0, grade_level.size() - 1))
