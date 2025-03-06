class_name MessageDispatcher extends Node

static var _instance:MessageDispatcher = null

static func instance()->MessageDispatcher:
	if(!_instance):
		_instance = MessageDispatcher.new()
	return _instance
	
var delayedMessages:Array = []

func DispatchMessage(senderID:int, receiverID:int, msg:int, dispatchTime:float, extraInfo:Variant)->void:
	var receiver:BaseGameEntity = EntityManager.instance().GetEntityFromID(receiverID)
	var telegram:Telegram = Telegram.new(senderID, receiverID, msg, dispatchTime, extraInfo)
	if dispatchTime <= 0.0:
		Discharge(receiver, telegram)
	else:
		delayedMessages.append(telegram)
		InsertionSort()
		
func DispatchDelayedMessage()->void:
	var currentTime: float = Time.get_ticks_msec() / 1000
	while !delayedMessages.is_empty() and delayedMessages[0].dispatchTime <= currentTime:
		var telegram:Telegram = delayedMessages.pop_front()
		var receiver = EntityManager.instance().GetEntityFromID(telegram.receiver)
		Discharge(receiver, telegram)
		
func Discharge(receiver: BaseGameEntity, telegram: Telegram)->void:
	if receiver != null:
		receiver.HandleMessage(telegram)	

func InsertionSort()->void:
	for i in range(1, delayedMessages.size()):
		var current:Telegram = delayedMessages[i]
		var j:int = i -1
		
		while j>=0 && delayedMessages[j].dispatchTime > current.dispatchTime:
			delayedMessages[j+1] = delayedMessages[j]
			j-=1
		delayedMessages[j+1] = current
