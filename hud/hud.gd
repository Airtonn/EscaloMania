extends CanvasLayer

@onready var score_text = $score
var score_atual : int

func _ready() -> void:
	score_atual = 0
	GlobalSignal.pontuacao.connect(Pontuar)

func Pontuar(value):
	# Incrementa o score atual com o valor de aumento_score.
	score_atual += value
	# Atualiza o texto do Label com o score atual formatado.
	# A formatação "%010d" garante que o número tenha 10 dígitos, 
	# preenchendo com zeros à esquerda se necessário.
	score_text.text = str(score_atual)

func _on_quit_pressed() -> void:
	get_tree().quit()
