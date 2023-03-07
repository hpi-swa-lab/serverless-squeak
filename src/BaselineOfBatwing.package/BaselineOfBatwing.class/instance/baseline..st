baseline
baseline: spec
	<baseline>
	spec
		for: #'common' 
		do: [
			spec
				package: 'Batwing'.
			spec
				group: 'default' with: #('Batwing').
			spec
				postLoadDoIt: #postLoad.]