extends Node2D

var Interact = [
{
	"Name" : "Катя",
	"Text": "Ох, привет"
},
{
	"Name" : "Катя",
	"Text": "Неожидала тебя тут увидеть. Тебя ко мне Женя прислала?"
},
{
	"Name" : "Женя",
	"Text": "Смари как могу"
},
{
	"Name" : "Женя",
	"Text": "Ну как?",
	"Emotion": ["EyePatch off", "face smile","hair simple"]
},
{
	"Name" : "Женя",
	"Text": "Ладно, шучу",
},
{
	"Name" : "ГГтян",
	"Text": "Угу, она зачем-то про ключ говорила. Что это за ключ?"
},
{
	"Name" : "Женя",
	"Text": "Ладно, шучу",
},
{
	"Name" : "Катя",
	"Text": "А, это ключ от той большой двери. Ты разве не знала?"
},
{
	"Name" : "ГГтян",
	"Text": "Нет, не знала"	
},
{
	"Name": "Катя",
	"Text": "Ну вот теперь знаешь. В любом случае, я потеряла кошелек. Поможешь его найти?",
	"Choice": ["Да","Нет","Знаешь, мы можем решить это дипломатически."],
	"Slot": ["afterChoise1","afterChoise2","afterChoise3"]
}
]
var afterChoise1 = [
{
	"Name" : "Катя",
	"Text": "Отлично!"
},
{
	"Name" : "Катя",
	"Text": "Отлично"
},
{
	"Name" : "",
	"Text": "",
	"SearchPhase": ""
},
{
	"Name" : "Катя",
	"Text": "Пасиба!"
},
{
	"Name": "",
	"Text": "",
	"End": "res://scenes/Corridor.tscn"
}
]

var afterChoise2 = [
{
	"Name" : "Катя",
	"Text": "Херовый из тебя помошник"
},
{
	"Name" : "Катя",
	"Text": "Херовый из тебя помошник"
},
{
	"Name" : "Катя",
	"Text": "Херовый из тебя помошник"
},
{
	"Name": "",
	"Text": "",
	"End": "res://scenes/Corridor.tscn"
}
]

var afterChoise3 = [
{
	"Name" : "Катя",
	"Text": "Ладно."
},
{
	"Name": "",
	"Text": "",
	"End": ""
}
]
