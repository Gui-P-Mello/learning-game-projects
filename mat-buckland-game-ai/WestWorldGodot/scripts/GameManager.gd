class_name GameManager extends Node

var miner:Miner

func _ready():
	miner = Miner.new(0)

func _process(delta):
	miner.Update()
