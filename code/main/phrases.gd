extends Node2D

var KeyFound = false
var PaperFound = false
var phrasesJenya = [
	{
	"Name":"Женя",
	"Text":"Привет!"
	},
	{
	"Name":"Женя",
	"Text":"Слушай, а это не ты брала ключ?"
	},
	{
	"Name":"Женя",
	"Choice": ["Да, вот он","Угмг...не...знаю"],
	"Text":"У тебя он есть?"
	}
	
]

var JenyaafterchoiseY = [{
	"Name": "Женя",
	"Text": "Оу",
	
},
{
	"Name": "Женя",
	"Text": "Кстати, Кате нужна твоя помощь в одном из классов.",
},
{
	"Name": "Женя",
	"Text": "Так что иди и помоги ей."
}
]

var JenyaafterchoiseN = [{
	"Name": "Женя",
	"Text": "Не поняла",
}]
