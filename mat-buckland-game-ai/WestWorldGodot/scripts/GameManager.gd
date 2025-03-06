class_name GameManager extends Node

var entityManager: EntityManager
var miner:Miner
var elsa:Elsa

func _ready():
	entityManager = EntityManager.instance()
	miner = Miner.new(EntityNames.ent_Miner_Bob)
	entityManager.RegisterEntity(miner)
	elsa = Elsa.new(EntityNames.ent_Elsa)
	entityManager.RegisterEntity(elsa)

func _process(delta):
	miner.Update()
	elsa.Update()
	MessageDispatcher.instance().DispatchDelayedMessage()
