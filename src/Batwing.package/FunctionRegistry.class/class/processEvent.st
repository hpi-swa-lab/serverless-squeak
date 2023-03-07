as yet unclassified
processEvent
	"comment stating purpose of message"

	| webResponse requestId |
	
	self log: 'Entering loop.'.
	self log: (self awsLambdaInvocation).
	
	[self isPolling] whileTrue: [
		webResponse := WebClient httpGet: (self awsLambdaInvocation).
		
		requestId := (webResponse headersAt: 'Lambda-Runtime-Aws-Request-Id') at: 1.
		self log: 'REQUEST ID'.
		self log: (self awsLambdaResponse: requestId).
		
		WebClient httpPost: (self awsLambdaResponse: requestId)  content: 'Hello from Squeak.' type: 'text/plain'.
		self log: 'Success!'.
	]
	
