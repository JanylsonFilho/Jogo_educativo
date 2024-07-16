extends Node

class_name Pergunta_floresta
signal ix

@onready var a = $controls/A
@onready var b = $controls/B
@onready var c = $controls/C
@onready var d = $controls/D
@onready var label = $NinePatchRect/Label

var strList = [
	"Qual é o plural de país?",
	"Qual é o antônimo de 'efêmero'?",
	"Qual é um sinônimo para 'obstinado'?",
	"Qual é a forma singular de 'fenômenos'?",
	"Qual é o plural de 'cidadão'?"
]

var respList1 = [
	"a) Países",  
	"a) Duradouro", 
	"a) Determinado", 
	"a) Fenômeno", 
	"a) Cidadãos"
]
var respList2 = [ 
	"b) Paísses", 
	"b) Passageiro", 
	"b) Indeciso", 
	"b) Fenomenais", 
	"b) Cidadães"
]
var respList3 =[ 
	"c) País", 
	"c) Fugaz", 
	"c) Vacilante", 
	"c) Fenômena", 
	"c) Cidadões"
]
var respList4 = [ 
	"d) Paísos",  
	"d) Temporário", 
	"d) Relutante", 
	"d) Fenomenal", 
	"d) Cidades"
]
var respCerta = [ 
	"a) Países", 
	"a) Duradouro", 
	"a) Determinado", 
	"a) Fenômeno", 
	"a) Cidadãos"
]

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var ix = rng.randi_range(0, strList.size() - 1)

	label.text = strList[ix]
	a.text = respList1[ix]
	b.text = respList2[ix]
	c.text = respList3[ix]
	d.text = respList4[ix]
	Global.resp1 = respList1[ix]
	Global.resp2 = respList2[ix]
	Global.resp3 = respList3[ix]
	Global.resp4 = respList4[ix]
	Global.correct_answer = respCerta[ix]
	emit_signal("ix", ix)
	print(ix)

func _physics_process(delta):
	print(Global.correct_answer)

func _process(delta):
	if Input.is_action_just_pressed("A"):
		_check_answer(a.text)
	elif Input.is_action_just_pressed('B'):
		_check_answer(b.text)
	elif Input.is_action_just_pressed('C'):
		_check_answer(c.text)
	elif Input.is_action_just_pressed('D'):
		_check_answer(d.text)

func _check_answer(selected_answer):
	if selected_answer == Global.correct_answer:
		get_tree().change_scene_to_file("res://youwin.tscn")
	else:
		get_tree().change_scene_to_file("res://game_over.tscn")
