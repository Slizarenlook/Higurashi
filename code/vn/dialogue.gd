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
	"Emotion": ["EyePatch off", "face smile"]
},
{
	"Name" : "Женя",
	"Text": "Ладно, шучу",
	"Emotion": ["EyePatch on", "face astonishment"]
},
{
	"Name" : "ГГтян",
	"Text": "Угу, она зачем-то про ключ говорила. Что это за ключ?"
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
	"Choice": ["Да","Да"]
}
]
var afterChoise1 = [
{
	"Name" : "Катя",
	"Text": "Отлично, начинаем поиски!"
},
{
	"Name": "",
	"Text": "",
	"SearchPhase": ""
},
{
	"Name": "Катя",
	"Text": "Ты его нашла, спасибо!"
},
{
	"Name": "",
	"Text": "",
	"End": ""
}

]

var afterChoise2 = [
{
	"Name" : "Катя",
	"Text": "Отлично, начинаем поиски!"
},
{
	"Name": "",
	"Text": "",
	"SearchPhase": ""
},
{
	"Name": "Катя",
	"Text": "Ты его нашла, спасибо!"
},
{
	"Name": "",
	"Text": "",
	"End": ""
}
]
