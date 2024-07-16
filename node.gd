extends Node

class_name Pergunta_node
signal ix

@onready var a = $controls/A
@onready var b = $controls/B
@onready var c = $controls/C
@onready var d = $controls/D
@onready var label = $NinePatchRect/Label

var strList = [
	"Como se divide em sílabas a palavra chuva?",
	"Qual é a separação correta da palavra peixe?",
	"Como se divide em sílabas a palavra prato?",
	"Qual é a separação correta da palavra leite?",
	"Como se divide em sílabas a palavra leão?",
	"Qual é a separação correta da palavra amor?",
	"Qual é o antônimo de 'corajoso'?",
	"Qual é o antônimo de 'pobre'?",
	"Qual é um sinônimo para 'difícil'?",
	"Qual é um sinônimo para 'forte'?",
	"Qual é a forma singular de 'carros'?",
	"Qual é a forma singular de 'bicicletas'?",
	"Qual é o plural de 'papel'?",
	"Qual é o plural de 'coração'?"
]

var respList1 = [
	"a) chuv-a",
	"a) pei-che",
	"a) prato",
	"a) leit-e",
	"a) leão",
	"A) am-or",
	"a) Medroso",
	"a) Rico",
	"a) Complicado",
	"a) Fraco",
	"a) Carro",
	"a) Bicicleta",
	"a) Papéis",
	"a) Corações"
]

var respList2 = [
	"b) ch-uva",
	"b) pei-xh e",
	"b) pr-a-to",
	"b) le-i-te",
	"b) l-eão",
	"b) amor",
	"b) Valente",
	"b) Miserável",
	"b) Fácil",
	"b) Poderoso",
	"b) Carrais",
	"b) Bicicletos",
	"b) Papelões",
	"b) Coraçãos"
]

var respList3 = [
	"c) chuv-a",
	"c) pei-xhe",
	"c) prat-o",
	"c) le-ite",
	"c) le-ã-o",
	"c) amo-r",
	"c) Destemido",
	"c) Necessitado",
	"c) Simples",
	"c) Débil",
	"c) Carras",
	"c) Biciclet",
	"c) Papéus",
	"c) Coraçãoes"
]

var respList4 = [
	"d) chu-va",
	"d) pei-xe",
	"d) pra-to",
	"d) lei-te",
	"d) le-ão",
	"d) a-mor",
	"d) Audacioso",
	"d) Desfavorecido",
	"d) Tranquilo",
	"d) Frágil",
	"d) Carros",
	"d) Bicicletas",
	"d) Papeleiros",
	"d) Corassões"
]

var respCerta = [
	"d) chu-va",
	"d) pei-xe",
	"d) pra-to",
	"d) lei-te",
	"d) le-ão",
	"d) a-mor",
	"a) Medroso",
	"a) Rico",
	"a) Complicado",
	"b) Poderoso",
	"a) Carro",
	"a) Bicicleta",
	"a) Papéis",
	"a) Corações"
]

var correct_answers = 0
var total_questions = 2
var current_question = -1

func _ready():
	_next_question()

func _process(delta):
	if Input.is_action_just_pressed("A"):
		_check_answer(a.text)
	elif Input.is_action_just_pressed("B"):
		_check_answer(b.text)
	elif Input.is_action_just_pressed("C"):
		_check_answer(c.text)
	elif Input.is_action_just_pressed("D"):
		_check_answer(d.text)

func _on_A_pressed():
	_check_answer(a.text)

func _on_B_pressed():
	_check_answer(b.text)

func _on_C_pressed():
	_check_answer(c.text)

func _on_D_pressed():
	_check_answer(d.text)

func _check_answer(selected_answer):
	if selected_answer == Global.correct_answer:
		correct_answers += 1
		if correct_answers >= total_questions:
			get_tree().change_scene_to_file("res://main_dialogo.tscn")
			return
	else:
		get_tree().change_scene_to_file("res://game_over.tscn")
		return
	_next_question()

func _next_question():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var ix = rng.randi_range(0, strList.size() - 1)
	while ix == current_question:
		ix = rng.randi_range(0, strList.size() - 1)
	current_question = ix

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
