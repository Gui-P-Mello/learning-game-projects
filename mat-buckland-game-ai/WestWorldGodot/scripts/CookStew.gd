class_name CookStew extends State

static var _instance:CookStew

var messageDispatcher:MessageDispatcher = MessageDispatcher.instance()

static func instance()->CookStew:
	if !_instance:
		_instance = CookStew.new()
	return _instance

func enter(wife:Elsa)->void:
	if(!wife.Cooking()):
		print("\n", EntityNames.GetNameOfEntity(wife.ID()), ": Puttin' the stew in the oven")
		
		messageDispatcher.DispatchMessage(wife.ID(), wife.ID(), Message.message_type.msg_StewReady, 0.5, null)
		wife.SetCooking(true)

func execute(wife:Elsa)->void:
	print("\n", EntityNames.GetNameOfEntity(wife.ID()), ": Fussin' over food")

func OnMessage(wife:BaseGameEntity, telegram:Telegram)->bool:
	match(telegram.msg):
		Message.message_type.msg_StewReady:
			print("\nMessage received by ", EntityNames.GetNameOfEntity(wife.ID()), " at time: ", Time.get_ticks_msec() / 1000)
			print("\n", EntityNames.GetNameOfEntity(wife.ID()), ": Stew ready! Let's eat")
			
			messageDispatcher.DispatchMessage(wife.ID(), EntityNames.ent_Miner_Bob, Message.message_type.msg_StewReady, 0.0, null)
			wife.SetCooking(false)
			wife.el_stateMachine.ChangeState(DoHousework.instance())
			return true
		_:
			return false
