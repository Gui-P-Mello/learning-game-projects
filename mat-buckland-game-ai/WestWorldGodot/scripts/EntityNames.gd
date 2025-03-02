class_name  EntityNames
enum{
	ent_Miner_Bob,
	ent_Elsa
}

static func  GetNameOfEntity(n:int)-> String:
	match(n):
		ent_Miner_Bob:
			return "Miner Bob"
		ent_Elsa:
			return "Elsa"
		_:
			return "Unknown"
