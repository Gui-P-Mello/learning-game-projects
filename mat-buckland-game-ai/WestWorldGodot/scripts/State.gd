class_name State 

func enter(entity)->void:
	pass
func execute(entity)->void:
	pass
	
func exit(entity)->void:
	pass

func OnMessage(entity:BaseGameEntity, telegram:Telegram)->bool:
	return false
