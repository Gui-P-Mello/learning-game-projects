class_name Telegram

var sender:int
var receiver:int
var msg:int
var dispatchTime:float
var extraInfo:Variant

func _init(sender:int, receiver:int, msg:int, dispatchTime:float, exxtraInfo:Variant):
	self.sender = sender
	self.receiver = receiver
	self.msg = msg
	self.dispatchTime = dispatchTime
	self.extraInfo = extraInfo
