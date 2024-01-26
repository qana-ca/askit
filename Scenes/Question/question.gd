extends Node

# Question
@onready var question = %Question
# Buttons
@onready var first_answer_button = %FirstAnswerButton
@onready var second_answer_button = %SecondAnswerButton
# Count
@onready var right_answers_count = %RightAnswersCount
@onready var wrong_answers_count = %WrongAnswersCount
# Top
@onready var questions_count = %QuestionsCount
@onready var selected_deck = %SelectedDeck

const QUESTIONS_IN_DECK_COUNT = 30;
var right_answers = 0;
var wrong_answers = 0;

func update_right_answers_count(isInit: bool = false):
	if (!isInit): right_answers += 1;
	right_answers_count.text = "Верных ответов: " + str(right_answers);
	
func update_wrong_answers_count(isInit: bool = false):
	if (!isInit): wrong_answers += 1;
	wrong_answers_count.text = "Неверных ответов: " + str(wrong_answers);

func update_questions_count():
	questions_count.text = str(GlobalVariables.currentQuestionIndex + 1) + "/" + str(QUESTIONS_IN_DECK_COUNT);
	
func get_deck_name(deck: String):
	match deck:
		"javascript":
			return "JavaScript"
		"typescript":
			return "TypeScript"
		"csharp":
			return "C#"
	
	

func _ready():
	right_answers_count.text = "0"
	wrong_answers_count.text = "0"
	selected_deck.text = get_deck_name(GlobalVariables.pickedDeck);
	update_questions_count()
	update_right_answers_count(true)
	update_wrong_answers_count(true)
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
			first_answer_button.text = currentQuestion.answerWrong
			second_answer_button.text = currentQuestion.answerRight
		else:
			first_answer_button.text = currentQuestion.answerRight
			second_answer_button.text = currentQuestion.answerWrong
	else:
		get_tree().change_scene_to_file("res://Scenes/PickDeck/pick_deck.tscn")
		
func on_asnwer(was_right: bool):
	GlobalVariables.currentQuestionIndex += 1;
	
	if (was_right):
		update_right_answers_count()
	else:
		update_wrong_answers_count()
	
	pick_question();
	update_questions_count();

func _on_first_answer_pressed():
	var currentQuestion = GlobalVariables.questions[GlobalVariables.pickedDeck][GlobalVariables.currentQuestionIndex]
	
	var was_right = currentQuestion.answerRight == first_answer_button.text;
	
	on_asnwer(was_right)


func _on_second_answer_pressed():
	var currentQuestion = GlobalVariables.questions[GlobalVariables.pickedDeck][GlobalVariables.currentQuestionIndex]
	
	var was_right = currentQuestion.answerRight == second_answer_button.text;
	
	on_asnwer(was_right)
