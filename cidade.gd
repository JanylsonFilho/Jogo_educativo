extends Node

class_name Pergunta_cidade
signal ix

@onready var a = $controls/A
@onready var b = $controls/B
@onready var c = $controls/C
@onready var d = $controls/D
@onready var label = $NinePatchRect/Label

var strList = ["Qual é o plural de cachorro?",
"Qual é o plural de gato?",
"Qual é o antônimo de grande?",
"Qual é um sinônimo para pequeno?",
"Como se divide em sílabas a palavra chuva?",
"Qual é a separação correta da palavra peixe?",
"Qual é o plural de flor?",
"Qual é o plural de criança?",
"Qual é o oposto de frio?",
"Qual é o antônimo de alto?",
"Qual é um outro termo para rápido?",
"Qual é o sinônimo de bonito?",
"Como se divide em sílabas a palavra 'casa'?",
"Qual é a separação correta da palavra 'banana'?",
"Qual é o antônimo de 'feliz'?",
"Qual é o antônimo de 'novo'?",
"Qual é um sinônimo para 'inteligente'?",
"Qual é um sinônimo para 'rápido'?",
"Qual é a forma singular de 'casas'?",
"Qual é a forma singular de 'pés'?",
"Qual é o plural de 'livro'?",
"Qual é o plural de 'flor'?"]

var respList1 = ["a) Cachorras", "a) Gatas", "a) Pequeno", "a) Grande", "a) chu-va", "a) pei-xe",
"a) Flora", "a) Criançãos", "a) Quente", "a) Baixo", "a) Lento", "a) Feio",
"a) ca-sa", "a) ba-nan-a", "a) Alegre", "a) Velho", "a) Estúpido", "a) Lento", "a) Casas", "a) Pé", "a) Livros", "a) Flores"]
var respList2 = ["b) Cachorros", "b) Gatos", "b) Alto", "b) Diminuto", "b) ch-uva", "b) pei-che",
"b) Flores", "b) Criançãs", "b) Gelado", "b) Pequeno", "b) Devagar", "b) Lindo",
"b) cas-a", "b) ban-ana", "b) Triste", "b) Jovem", "b) Esperto", "b) Devagar", "b) Casais", "b) Pes", "b) Livres", "b) Flora"]
var respList3 = ["c) Cachorras", "c) Gatinhas", "c) Rápido", "c) Baixo", "c) chuv-a", "c) pe-i-xe",
"c) Floresta", "c) Criançães", "c) Congelado", "c) Longo", "c) Veloz", "c) Horrível",
"c) ca-s-a", "c) ba-na-na", "c) Contente", "c) Atual", "c) Lento", "c) Veloz", "c) Casa", "c) Pés", "c) Livroes", "c) Floras"]
var respList4 = ["d) Cachorrinhos", "d) Gatinhos", "d) Forte", "d) Gigante", "d) ch-uva", "d) pei-xhe",
"d) Florido", "d) Crianças", "d) Fresco", "d) Largo ", "d) Manso", "d) Desagradável",
"d) c-asa", "d) ba-nana", "d) Satisfeito", "d) Recente", "d) Tolo", "d) Parado", "d) Cais", "d) Pás", "d) Livra", "d) Floridos"]
var respCerta = ["b) Cachorros", "b) Gatos", "a) Pequeno", "c) Baixo", "a) chu-va", "a) pei-xe",
"b) Flores", "d) Crianças", "a) Quente", "a) Baixo", "c) Veloz", "b) Lindo",
"a) ca-sa", "c) ba-na-na", "b) Triste", "a) Velho", "b) Esperto", "c) Veloz", "c) Casa", "a) Pé", "a) Livros", "a) Flores"]

var correct_answers = 0
var total_questions = 3  # Alterado para 3 perguntas necessárias para passar
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
			get_tree().change_scene_to_file("res://node_dialogo.tscn")
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

func _on_d_pressed():
	pass # Replace with function body.

func _on_c_pressed():
	pass # Replace with function body.

func _on_b_pressed():
	pass # Replace with function body.

func _on_a_pressed():
	pass # Replace with function body.
