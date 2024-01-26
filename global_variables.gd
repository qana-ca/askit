extends Node

var questions = {
	# JavaScript questions
	"javascript": [
		{
			"question": "Is javasript numbers type are object?",
			"answerWrong": "No",
			"answerRight": "Yes"
		},
		{
			"question": "In JavaScript, what is a pure function?",
			"answerWrong": "A function with side effects",
			"answerRight": "A function that always produces the same result given the same input"
		},
		{
			"question": "What is the purpose of the 'use strict' mode in JavaScript?",
			"answerWrong": "Enabling flexible parsing",
			"answerRight": "Catching common coding mistakes and preventing the use of certain error-prone features"
		},
		{
			"question": "How does the event loop work in JavaScript?",
			"answerWrong": "It executes all tasks simultaneously",
			"answerRight": "It continuously checks the message queue for tasks and executes them one by one"
		}
	],
	# TypeScript
	"typescript": [],
	# CSharp
	"csharp": []
}

var currentQuestionIndex = 0

enum Decks {
	JavaScript,
	TypeScript,
	CSharp
}

var pickedDeck = null

func pick_deck(deck):
	pickedDeck = deck
	currentQuestionIndex = 0
	print(pickedDeck)
