as yet unclassified
startUp: resuming
	"start initialization phase of the lambda function"

	"Resuming from saved image"
	resuming ifTrue: [self processEvent].
	