class_name GameManager extends Node

var miner:Miner
var elsa:Elsa

func _ready():
	miner = Miner.new(EntityNames.ent_Miner_Bob)
	elsa = Elsa.new(EntityNames.ent_Elsa)

func _process(delta):
	miner.Update()
	elsa.Update()
