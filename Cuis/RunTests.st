[ | stdout result |
	stdout := StdIOWriteStream stdout.
	[
		Feature require: 'StreamDeck'.
		result := (TestSuite forSystemCategoryNamed: 'StreamDeck-Tests' using: SystemOrganization) run.
		stdout nextPutAll: result printString; newLine.
		result defects do: [ :test | stdout nextPutAll: test printString; newLine ].
		Smalltalk quitPrimitive: (result hasPassed ifTrue: [ 0 ] ifFalse: [ 1 ]) ]
			on: Error
			do: [ :error |
				stdout nextPutAll: error description; newLine.
				Smalltalk quitPrimitive: 1 ] ] fork
