as yet unclassified
awsLambdaInvocation
	"comment stating purpose of message"
	
	| host |
	
	host := self env: 'AWS_LAMBDA_RUNTIME_API'.
	^ 'http://',  host , '/2018-06-01/runtime/invocation/next'.