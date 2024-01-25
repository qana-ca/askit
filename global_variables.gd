extends Node

var questions = {
	"javascript": [
		{
			"question": "Is javasript numbers type are object?",
			"answerWrong": "No",
			"answerRight": "Yes"
		}
	],
	"typescript": [],
	"csharp": []
}
var currentQuestionIndex = 0

var pickedDeck = null

func pick_deck(deck):
	pickedDeck = deck
	currentQuestionIndex = 0
	print(pickedDeck)
