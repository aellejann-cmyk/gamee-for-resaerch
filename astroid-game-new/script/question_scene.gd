extends Control
signal correct
signal wrong

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
var grade10 = [
	{
		"question": "What type of star is the Sun?",
		"options": [
			"Red giant",
			"White dwarf",
			"Main-sequence",
			"Neutron star"
		],
		"correct_answer": "Main-sequence"
	},
	{
		"question": "What is a galaxy?",
		"options": [
			"Group of planets",
			"Group of stars, gas, and dust",
			"Single star",
			"Asteroid belt"
		],
		"correct_answer": "Group of stars, gas, and dust"
	},
	{
		"question": "What happens when a star runs out of fuel?",
		"options": [
			"Explodes instantly",
			"Disappears",
			"Changes based on size",
			"Becomes a planet"
		],
		"correct_answer": "Changes based on size"
	},
	{
		"question": "Which planet has the most known moons?",
		"options": [
			"Earth",
			"Mars",
			"Jupiter",
			"Venus"
		],
		"correct_answer": "Jupiter"
	},
	{
		"question": "Which region lies beyond Neptune?",
		"options": [
			"Asteroid Belt",
			"Oort Cloud",
			"Kuiper Belt",
			"Inner system"
		],
		"correct_answer": "Kuiper Belt"
	},
	{
		"question": "What is a light-year?",
		"options": [
			"Time measurement",
			"Distance light travels in one year",
			"Star brightness",
			"Age of the Sun"
		],
		"correct_answer": "Distance light travels in one year"
	},
	{
		"question": "Why do comets form tails near the Sun?",
		"options": [
			"Collect dust",
			"Gravity increases",
			"Ice turns to gas",
			"Faster rotation"
		],
		"correct_answer": "Ice turns to gas"
	},
	{
		"question": "Why are red giants red?",
		"options": [
			"Hotter than blue stars",
			"Cooler surface temperature",
			"Reflect red light",
			"Made of gas"
		],
		"correct_answer": "Cooler surface temperature"
	},
	{
		"question": "What do supernovae contribute to space?",
		"options": [
			"Destruction only",
			"New planets",
			"Heavy elements",
			"Darkness"
		],
		"correct_answer": "Heavy elements"
	},
	{
		"question": "Why are elliptical galaxies older?",
		"options": [
			"Faster rotation",
			"Mostly young stars",
			"Little gas for star formation",
			"Smaller size"
		],
		"correct_answer": "Little gas for star formation"
	}
]
var grade9 = [
	{
		"question": "What keeps planets in orbit around the Sun?",
		"options": [
			"Solar wind",
			"Magnetic force",
			"The Sun’s gravity",
			"Planet rotation"
		],
		"correct_answer": "The Sun’s gravity"
	},
	{
		"question": "Which planet has the strongest gravity?",
		"options": [
			"Earth",
			"Saturn",
			"Jupiter",
			"Neptune"
		],
		"correct_answer": "Jupiter"
	},
	{
		"question": "Why do stars appear to move across the sky at night?",
		"options": [
			"Stars orbit Earth",
			"Earth’s rotation",
			"Earth’s revolution",
			"Wind movement"
		],
		"correct_answer": "Earth’s rotation"
	},
	{
		"question": "Why do astronauts float inside spacecraft?",
		"options": [
			"No gravity exists",
			"Space has air",
			"Continuous free fall",
			"Bodies lose mass"
		],
		"correct_answer": "Continuous free fall"
	},
	{
		"question": "Which planet has a day longer than its year?",
		"options": [
			"Mercury",
			"Mars",
			"Venus",
			"Earth"
		],
		"correct_answer": "Venus"
	},
	{
		"question": "Which planet is least dense?",
		"options": [
			"Earth",
			"Mercury",
			"Saturn",
			"Mars"
		],
		"correct_answer": "Saturn"
	},
	{
		"question": "Why aren’t gas giants close to the Sun?",
		"options": [
			"They move slowly",
			"Solar heat prevents gas retention",
			"Weak gravity",
			"They formed late"
		],
		"correct_answer": "Solar heat prevents gas retention"
	},
	{
		"question": "What happens if the Sun loses mass suddenly?",
		"options": [
			"Planets move closer",
			"Planets escape orbit",
			"Earth stops rotating",
			"Days shorten"
		],
		"correct_answer": "Planets escape orbit"
	},
	{
		"question": "Which law explains faster planetary motion near the Sun?",
		"options": [
			"Newton’s First Law",
			"Kepler’s Second Law",
			"Kepler’s Third Law",
			"Law of Inertia"
		],
		"correct_answer": "Kepler’s Second Law"
	},
	{
		"question": "Why does gravity weaken with distance?",
		"options": [
			"Objects lose mass",
			"Gravity disappears",
			"Force spreads over distance",
			"Space has no force"
		],
		"correct_answer": "Force spreads over distance"
	}
]
var grade8 = [
	{
		"question": "Which planet takes the longest time to orbit the Sun?",
		"options": [
			"Earth",
			"Jupiter",
			"Neptune",
			"Mars"
		],
		"correct_answer": "Neptune"
	},
	{
		"question": "What happens during a solar eclipse?",
		"options": [
			"Earth blocks sunlight",
			"The Moon is between Earth and the Sun",
			"The Sun moves away",
			"The Moon disappears"
		],
		"correct_answer": "The Moon is between Earth and the Sun"
	},
	{
		"question": "Why does a lunar eclipse occur?",
		"options": [
			"Moon blocks the Sun",
			"Earth blocks sunlight from the Moon",
			"The Sun stops shining",
			"The Moon leaves orbit"
		],
		"correct_answer": "Earth blocks sunlight from the Moon"
	},
	{
		"question": "What causes tides on Earth?",
		"options": [
			"Wind",
			"Earth’s rotation",
			"The Moon’s gravity",
			"Ocean currents"
		],
		"correct_answer": "The Moon’s gravity"
	},
	{
		"question": "What would happen if Earth’s axis were not tilted?",
		"options": [
			"Longer days",
			"No gravity",
			"No seasons",
			"Shorter years"
		],
		"correct_answer": "No seasons"
	},
	{
		"question": "Why do inner planets have shorter years?",
		"options": [
			"They spin faster",
			"They are smaller",
			"They are closer to the Sun",
			"They have fewer moons"
		],
		"correct_answer": "They are closer to the Sun"
	},
	{
		"question": "What determines the path of planets in the solar system?",
		"options": [
			"The Moon",
			"Asteroids",
			"The Sun’s gravity",
			"Earth’s rotation"
		],
		"correct_answer": "The Sun’s gravity"
	},
	{
		"question": "Why does Mercury have extreme temperatures?",
		"options": [
			"Too many moons",
			"Thick clouds",
			"Almost no atmosphere",
			"Too much water"
		],
		"correct_answer": "Almost no atmosphere"
	},
	{
		"question": "What causes seasons on Earth?",
		"options": [
			"Distance from the Sun",
			"Earth’s tilted axis and revolution",
			"Earth’s rotation",
			"Moon phases"
		],
		"correct_answer": "Earth’s tilted axis and revolution"
	},
	{
		"question": "Why don’t eclipses happen every month?",
		"options": [
			"The Moon moves slowly",
			"Earth blocks sunlight",
			"The Moon’s orbit is tilted",
			"The Sun changes size"
		],
		"correct_answer": "The Moon’s orbit is tilted"
	}
]
var grade7 = [
	{
		"question": "What is the center of our solar system?",
		"options": [
			"The Moon",
			"The Earth",
			"The Sun",
			"Mars"
		],
		"correct_answer": "The Sun"
	},
	{
		"question": "Which planet is known as the “Red Planet”?",
		"options": [
			"Venus",
			"Mars",
			"Jupiter",
			"Saturn"
		],
		"correct_answer": "Mars"
	},
	{
		"question": "What do we call a group of stars forming a pattern in the sky?",
		"options": [
			"Galaxy",
			"Comet",
			"Constellation",
			"Planet"
		],
		"correct_answer": "Constellation"
	},
	{
		"question": "Which object orbits around the Earth?",
		"options": [
			"The Sun",
			"Mars",
			"The Moon",
			"Asteroid"
		],
		"correct_answer": "The Moon"
	},
	{
		"question": "What is the Milky Way?",
		"options": [
			"A planet",
			"A galaxy",
			"A star",
			"A nebula"
		],
		"correct_answer": "A galaxy"
	},
	{
		"question": "What causes day and night on Earth?",
		"options": [
			"Earth’s revolution",
			"The Moon’s movement",
			"Earth’s rotation",
			"Solar flares"
		],
		"correct_answer": "Earth’s rotation"
	},
	{
		"question": "Which planet has the most visible rings?",
		"options": [
			"Jupiter",
			"Uranus",
			"Saturn",
			"Neptune"
		],
		"correct_answer": "Saturn"
	},
	{
		"question": "Why does the Moon have phases?",
		"options": [
			"Earth blocks sunlight",
			"The Moon changes shape",
			"We see different illuminated portions",
			"Clouds block the Moon"
		],
		"correct_answer": "We see different illuminated portions"
	},
	{
		"question": "What is a meteor?",
		"options": [
			"A comet in space",
			"A burning meteoroid in Earth’s atmosphere",
			"A rock on the Moon",
			"A star fragment"
		],
		"correct_answer": "A burning meteoroid in Earth’s atmosphere"
	},
	{
		"question": "Why do we only see one side of the Moon?",
		"options": [
			"The Moon does not rotate",
			"Earth blocks the other side",
			"The Moon rotates at the same rate it orbits Earth",
			"The Moon has no gravity"
		],
		"correct_answer": "The Moon rotates at the same rate it orbits Earth"
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
	grade_level.shuffle()

func _on_a_pressed() -> void:
	if labelA.text == str(correct_answer) and answer_picked == false:
		print("CORRECT ANSWER")
		answer_picked = true
		question_picked = false
		emit_signal("correct")
		visible = false
		questionpicker(randi_range(0, grade_level.size() - 1))
	elif labelA.text != str(correct_answer) and answer_picked == false:
		print("WRONG ANSWER")
		answer_picked = true
		question_picked = false
		emit_signal("wrong")
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
	elif labelB.text != str(correct_answer) and answer_picked == false:
		print("WRONG ANSWER")
		answer_picked = true
		question_picked = false
		emit_signal("wrong")
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
	elif labelC.text != str(correct_answer) and answer_picked == false:
		print("WRONG ANSWER")
		answer_picked = true
		question_picked = false
		emit_signal("wrong")
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
	elif labelD.text != str(correct_answer) and answer_picked == false:
		print("WRONG ANSWER")
		answer_picked = true
		question_picked = false
		emit_signal("wrong")
		visible = false
		questionpicker(randi_range(0, grade_level.size() - 1))

func pick():
	match Global.grade:
		12:
			grade_level = grade12
		11:
			grade_level = grade11
		10:
			grade_level = grade10
		9:
			grade_level = grade9
		8:
			grade_level = grade8
		7:
			grade_level = grade7
	questionpicker(randi_range(0, grade_level.size() - 1))
