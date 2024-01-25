extends Node

@onready var question = %Question
@onready var first_answer = %FirstAnswer
@onready var second_answer = %SecondAnswer
@onready var right_answers_count = $RightAnswersCount
@onready var wrong_answers_count = $WrongAnswersCount


func _ready():
	right_answers_count.text = "0"
	wrong_answers_count.text = "0"
	pick_question()

func pick_question():
	var currentDeck = GlobalVariables.questions[GlobalVariables.pickedDeck]
	if (currentDeck.size() == GlobalVariables.currentQuestionIndex):
		get_tree().change_scene_to_file("res://Scenes/PickDeck/pick_deck.tscn")
		return
	var currentQuestion = GlobalVariables.questions[GlobalVariables.pickedDeck][GlobalVariables.currentQuestionIndex]
	if (currentQuestion):
		print(GlobalVariables.currentQuestionIndex)
		question.text = currentQuestion.question
		var choice = randi() % 2 == 0
		if (choice):
			first_answer.text = currentQuestion.answerWrong
			second_answer.text = currentQuestion.answerRight
		else:
			first_answer.text = currentQuestion.answerRight
			second_answer.text = currentQuestion.answerWrong
	else:
		get_tree().change_scene_to_file("res://Scenes/PickDeck/pick_deck.tscn")

func on_right_answer():
	print("right")
	GlobalVariables.currentQuestionIndex += 1
	right_answers_count.text = str(right_answers_count.text.to_int() + 1)
		
	pick_question()
	
func on_wrong_answer():
	print("wrong")
	GlobalVariables.currentQuestionIndex += 1
	wrong_answers_count.text = str(wrong_answers_count.text.to_int() + 1)
		
	pick_question()

func _on_first_answer_pressed():
	var currentQuestion = GlobalVariables.questions[GlobalVariables.pickedDeck][GlobalVariables.currentQuestionIndex]
	
	if (currentQuestion.answerRight == first_answer.text):
		on_right_answer()
	else:
		on_wrong_answer()


func _on_second_answer_pressed():
	var currentQuestion = GlobalVariables.questions[GlobalVariables.pickedDeck][GlobalVariables.currentQuestionIndex]
	
	if (currentQuestion.answerRight == second_answer.text):
		on_right_answer()
	else:
		on_wrong_answer()
