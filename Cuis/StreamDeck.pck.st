'From Cuis7.9 [latest update: #8257] on 14 October 2026 at 10:18:19 am'!
'Description '!
!provides: 'StreamDeck' 0 0!
!requires: 'Identities-UUID' nil nil nil!
!requires: 'WebClient' nil nil nil!
!requires: 'JSON' nil nil nil!
!requires: 'OSProcess' nil nil nil!
SystemOrganization addCategory: #'StreamDeck-Server'!
SystemOrganization addCategory: #'StreamDeck-Tests'!
SystemOrganization addCategory: #'StreamDeck-Fakes'!


!classDefinition: #StreamDeckInMemoryFile category: #'StreamDeck-Fakes'!
Object subclass: #StreamDeckInMemoryFile
	instanceVariableNames: 'contents exists readableByOthers contentsEverReadableByOthers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StreamDeck-Fakes'!
!classDefinition: 'StreamDeckInMemoryFile class' category: #'StreamDeck-Fakes'!
StreamDeckInMemoryFile class
	instanceVariableNames: ''!

!classDefinition: #StreamDeckInMemoryFolder category: #'StreamDeck-Fakes'!
Object subclass: #StreamDeckInMemoryFolder
	instanceVariableNames: 'filesByName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StreamDeck-Fakes'!
!classDefinition: 'StreamDeckInMemoryFolder class' category: #'StreamDeck-Fakes'!
StreamDeckInMemoryFolder class
	instanceVariableNames: ''!

!classDefinition: #StreamDeckInstantUserInterfaceProcess category: #'StreamDeck-Fakes'!
Object subclass: #StreamDeckInstantUserInterfaceProcess
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StreamDeck-Fakes'!
!classDefinition: 'StreamDeckInstantUserInterfaceProcess class' category: #'StreamDeck-Fakes'!
StreamDeckInstantUserInterfaceProcess class
	instanceVariableNames: ''!

!classDefinition: #StreamDeckOfflineWebRequest category: #'StreamDeck-Fakes'!
Object subclass: #StreamDeckOfflineWebRequest
	instanceVariableNames: 'content headers response responseArrival'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StreamDeck-Fakes'!
!classDefinition: 'StreamDeckOfflineWebRequest class' category: #'StreamDeck-Fakes'!
StreamDeckOfflineWebRequest class
	instanceVariableNames: ''!

!classDefinition: #StreamDeckOfflineWebResponse category: #'StreamDeck-Fakes'!
Object subclass: #StreamDeckOfflineWebResponse
	instanceVariableNames: 'code content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StreamDeck-Fakes'!
!classDefinition: 'StreamDeckOfflineWebResponse class' category: #'StreamDeck-Fakes'!
StreamDeckOfflineWebResponse class
	instanceVariableNames: ''!

!classDefinition: #StreamDeckOfflineWebServer category: #'StreamDeck-Fakes'!
Object subclass: #StreamDeckOfflineWebServer
	instanceVariableNames: 'actionsByPath listenerPort listenerInterface'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StreamDeck-Fakes'!
!classDefinition: 'StreamDeckOfflineWebServer class' category: #'StreamDeck-Fakes'!
StreamDeckOfflineWebServer class
	instanceVariableNames: ''!

!classDefinition: #StreamDeckServer category: #'StreamDeck-Server'!
Object subclass: #StreamDeckServer
	instanceVariableNames: 'portNumber interfaceAddress token evaluationProcess webServer'
	classVariableNames: 'ThisServer'
	poolDictionaries: ''
	category: 'StreamDeck-Server'!
!classDefinition: 'StreamDeckServer class' category: #'StreamDeck-Server'!
StreamDeckServer class
	instanceVariableNames: ''!

!classDefinition: #StreamDeckSettingsFile category: #'StreamDeck-Server'!
Object subclass: #StreamDeckSettingsFile
	instanceVariableNames: 'file'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StreamDeck-Server'!
!classDefinition: 'StreamDeckSettingsFile class' category: #'StreamDeck-Server'!
StreamDeckSettingsFile class
	instanceVariableNames: ''!

!classDefinition: #StreamDeckUserInterfaceProcess category: #'StreamDeck-Server'!
Object subclass: #StreamDeckUserInterfaceProcess
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StreamDeck-Server'!
!classDefinition: 'StreamDeckUserInterfaceProcess class' category: #'StreamDeck-Server'!
StreamDeckUserInterfaceProcess class
	instanceVariableNames: ''!

!classDefinition: #StreamDeckServerIntegrationTest category: #'StreamDeck-Tests'!
TestCase subclass: #StreamDeckServerIntegrationTest
	instanceVariableNames: 'temporaryHomeFolder webServer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StreamDeck-Tests'!
!classDefinition: 'StreamDeckServerIntegrationTest class' category: #'StreamDeck-Tests'!
StreamDeckServerIntegrationTest class
	instanceVariableNames: ''!

!classDefinition: #StreamDeckServerTest category: #'StreamDeck-Tests'!
TestCase subclass: #StreamDeckServerTest
	instanceVariableNames: 'offlineWebServer streamDeckServer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StreamDeck-Tests'!
!classDefinition: 'StreamDeckServerTest class' category: #'StreamDeck-Tests'!
StreamDeckServerTest class
	instanceVariableNames: ''!


!StreamDeckInMemoryFile commentStamp: '<historical>' prior: 0!
Behaves like a FileEntry in the tests, holding its contents in memory.

Like a FileEntry, it can be read by others when it is created, until it is made readable only by its owner. It keeps everything written to it while others could read it, which is how the tests know that a token was never exposed.!

!StreamDeckInMemoryFolder commentStamp: '<historical>' prior: 0!
Behaves like a DirectoryEntry in the tests, holding its files in memory.

Like a DirectoryEntry, #// answers the file with that name, a missing one if nothing was written to it yet.!

!StreamDeckInstantUserInterfaceProcess commentStamp: '<historical>' prior: 0!
Evaluates closures right away, in the process that asks for it.

Behaves like StreamDeckUserInterfaceProcess in the tests, without waiting for the user interface.!

!StreamDeckOfflineWebRequest commentStamp: '<historical>' prior: 0!
Behaves like WebRequest in the tests.

Its content is the body as it arrives over the network, one character per byte, and it keeps the response it is answered with. An evaluation in the user interface process answers later, so #response waits up to two seconds for it.!

!StreamDeckOfflineWebResponse commentStamp: '<historical>' prior: 0!
The response a StreamDeckOfflineWebRequest was answered with: its code and its content, as a WebResponse holds them.!

!StreamDeckOfflineWebServer commentStamp: '<historical>' prior: 0!
Behaves like WebServer in the tests, answering only the messages StreamDeckServer sends to it, without opening any socket.

Requests are delivered with #post:to:authorization:, which answers the response. Like WebServer, it answers 404 to a path without a service and 500 when its action fails.!

!StreamDeckServer commentStamp: '<historical>' prior: 0!
Lets the Stream Deck plugin evaluate Smalltalk code in this image.

Answers POST /evaluations. The body is the code, encoded as UTF-8, and the request has to carry the token in its Authorization header, as Bearer <token>. A request without it is answered 401 and its code is not evaluated.

The code is evaluated in the evaluation process, the user interface process unless another one is given, the same way a Do it in a Workspace would evaluate it. The answer is 200 with the printString of the result, or 500 with the description of the error.

Serves through a WebServer, or anything that answers the same messages, listening on the given port and interface.!

!StreamDeckSettingsFile commentStamp: '<historical>' prior: 0!
The .cuisdeck.json file of a home folder, which this image and the Stream Deck plugin share to agree on a port and a token.

Creates the server that listens on that port and requires that token. When the file is missing, it is created with the port 2847 and a new random token, and made readable only by its owner before the token is written into it, so that nobody else can ever read the token.!

!StreamDeckUserInterfaceProcess commentStamp: '<historical>' prior: 0!
Evaluates closures in the user interface process, once it is in a safe state.

That is where the code sent by the Stream Deck runs: windows open and dialogs ask as they would from a Workspace.!

!StreamDeckServerIntegrationTest commentStamp: '<historical>' prior: 0!
Tests what the offline tests take for granted: that the real WebServer, its sockets and the files on disk behave as the fakes do.

Works in a temporary folder among the user files of the image, not in the home of the user, and removes it when done.!

!StreamDeckServerTest commentStamp: '<historical>' prior: 0!
Tests StreamDeckServer and StreamDeckSettingsFile with no contact with the outside.

Requests go through a StreamDeckOfflineWebServer, settings files live in a StreamDeckInMemoryFolder, and the code sent by the Stream Deck is evaluated by a StreamDeckInstantUserInterfaceProcess, except where evaluating in the user interface process is what is being tested.!

!StreamDeckInMemoryFile methodsFor: 'accessing' stamp: 'CAP 11/Oct/2026, 5:43:41 pm (UTC)'!
appendStreamDo: aClosure

	| appended |

	appended := String streamContents: aClosure.
	exists := true.
	contents := contents, appended.
	self noteWritten: appended! !

!StreamDeckInMemoryFile methodsFor: 'accessing' stamp: 'CAP 11/Oct/2026, 1:50:04 am (UTC)'!
fileContents

	^contents! !

!StreamDeckInMemoryFile methodsFor: 'accessing' stamp: 'CAP 11/Oct/2026, 5:43:41 pm (UTC)'!
fileContents: aString

	"Like FileEntry, the file is created anew, so it is readable by others again."

	exists := true.
	readableByOthers := true.
	contents := aString.
	self noteWritten: aString! !

!StreamDeckInMemoryFile methodsFor: 'initialization' stamp: 'CAP 11/Oct/2026, 5:43:41 pm (UTC)'!
initializeContaining: aString existing: isExisting readableByOthers: isReadableByOthers everReadableByOthers: someContents

	contents := aString.
	exists := isExisting.
	readableByOthers := isReadableByOthers.
	contentsEverReadableByOthers := someContents! !

!StreamDeckInMemoryFile methodsFor: 'testing' stamp: 'CAP 11/Oct/2026, 5:10:53 pm (UTC)'!
exists

	^exists! !

!StreamDeckInMemoryFile methodsFor: 'permissions' stamp: 'CAP 11/Oct/2026, 5:10:53 pm (UTC)'!
beReadableOnlyByOwner

	readableByOthers := false! !

!StreamDeckInMemoryFile methodsFor: 'permissions' stamp: 'CAP 11/Oct/2026, 5:43:41 pm (UTC)'!
contentsEverReadableByOthers

	"Everything written to me while anybody but my owner could read me."

	^contentsEverReadableByOthers! !

!StreamDeckInMemoryFile methodsFor: 'permissions' stamp: 'CAP 11/Oct/2026, 5:43:41 pm (UTC)'!
noteWritten: someContents

	readableByOthers ifTrue: [ contentsEverReadableByOthers := contentsEverReadableByOthers, someContents ]! !

!StreamDeckInMemoryFile class methodsFor: 'instance creation' stamp: 'CAP 11/Oct/2026, 5:43:41 pm (UTC)'!
missing

	^self new initializeContaining: '' existing: false readableByOthers: true everReadableByOthers: ''! !

!StreamDeckInMemoryFolder methodsFor: 'initialization' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
initializeHolding: aDictionaryOfFiles

	filesByName := aDictionaryOfFiles! !

!StreamDeckInMemoryFolder methodsFor: 'accessing' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
// aFileName

	^filesByName at: aFileName ifAbsentPut: [ StreamDeckInMemoryFile missing ]! !

!StreamDeckInMemoryFolder class methodsFor: 'instance creation' stamp: 'CAP 11/Oct/2026, 1:50:04 am (UTC)'!
empty

	^self new initializeHolding: Dictionary new! !

!StreamDeckInstantUserInterfaceProcess methodsFor: 'evaluating' stamp: 'CAP 5/Oct/2026, 3:47:43 am (UTC)'!
do: aClosure

	aClosure value! !

!StreamDeckOfflineWebRequest methodsFor: 'initialization' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
initializeCarrying: aBody withHeaders: aDictionaryOfHeaders answeredThrough: aSemaphore

	content := aBody.
	headers := aDictionaryOfHeaders.
	responseArrival := aSemaphore! !

!StreamDeckOfflineWebRequest methodsFor: 'accessing' stamp: 'CAP 11/Oct/2026, 1:48:11 am (UTC)'!
content

	^content! !

!StreamDeckOfflineWebRequest methodsFor: 'accessing' stamp: 'CAP 11/Oct/2026, 1:48:11 am (UTC)'!
headerAt: aHeaderName

	^headers at: aHeaderName ifAbsent: [ '' ]! !

!StreamDeckOfflineWebRequest methodsFor: 'responding' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
answer: aResponse

	response := aResponse.
	responseArrival signal! !

!StreamDeckOfflineWebRequest methodsFor: 'responding' stamp: 'CAP 11/Oct/2026, 9:52:39 pm (UTC)'!
bytesSentFor: aStringOrBytes

	"Like WebRequest, a text is sent with one byte per character, whatever encoding it has inside the image."

	^ByteArray withAll: (aStringOrBytes asArray collect: [ :each | each asInteger ])! !

!StreamDeckOfflineWebRequest methodsFor: 'responding' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
response

	"An evaluation in the user interface process is answered later, from that process."

	(responseArrival waitTimeoutMSecs: 2000) ifTrue: [ ^StreamDeckOfflineWebResponse code: 0 content: 'No response' ].

	^response! !

!StreamDeckOfflineWebRequest methodsFor: 'responding' stamp: 'CAP 11/Oct/2026, 9:51:27 pm (UTC)'!
send200Response: aString

	"Like WebRequest, the answer travels encoded as UTF-8, so it arrives with one character per byte."

	self answer: (StreamDeckOfflineWebResponse code: 200 content: aString asUtf8Bytes asString)! !

!StreamDeckOfflineWebRequest methodsFor: 'responding' stamp: 'CAP 11/Oct/2026, 9:52:39 pm (UTC)'!
sendResponseCode: aCode content: aStringOrBytes type: aContentType close: aBoolean

	self answer: (StreamDeckOfflineWebResponse code: aCode content: (self bytesSentFor: aStringOrBytes) asString)! !

!StreamDeckOfflineWebRequest class methodsFor: 'instance creation' stamp: 'CAP 11/Oct/2026, 1:48:11 am (UTC)'!
carrying: aBody authorizedWith: anAuthorization

	^self new
		initializeCarrying: aBody
		withHeaders: (Dictionary new at: 'Authorization' put: anAuthorization; yourself)
		answeredThrough: Semaphore new! !

!StreamDeckOfflineWebResponse methodsFor: 'initialization' stamp: 'CAP 11/Oct/2026, 1:48:11 am (UTC)'!
initializeCode: aCode content: aString

	code := aCode.
	content := aString! !

!StreamDeckOfflineWebResponse methodsFor: 'accessing' stamp: 'CAP 11/Oct/2026, 1:48:11 am (UTC)'!
code

	^code! !

!StreamDeckOfflineWebResponse methodsFor: 'accessing' stamp: 'CAP 11/Oct/2026, 1:48:11 am (UTC)'!
content

	^content! !

!StreamDeckOfflineWebResponse class methodsFor: 'instance creation' stamp: 'CAP 11/Oct/2026, 1:48:11 am (UTC)'!
code: aCode content: aString

	^self new initializeCode: aCode content: aString! !

!StreamDeckOfflineWebServer methodsFor: 'initialization' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
initializeServing: aDictionaryOfActionsByPath

	actionsByPath := aDictionaryOfActionsByPath! !

!StreamDeckOfflineWebServer methodsFor: 'serving' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
addService: aPath action: aClosure

	actionsByPath at: aPath put: aClosure! !

!StreamDeckOfflineWebServer methodsFor: 'serving' stamp: 'CAP 11/Oct/2026, 9:48:43 pm (UTC)'!
listenOn: aPortNumber interface: anInterfaceAddress

	"Nothing is opened: the port and the interface are only noted, and requests arrive through #post:to:authorization:."

	listenerPort := aPortNumber.
	listenerInterface := anInterfaceAddress! !

!StreamDeckOfflineWebServer methodsFor: 'requesting' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
deliver: aRequest to: aPath

	"As WebServer does, a path without a service is answered 404, and an error of the action 500."

	[ (actionsByPath at: aPath ifAbsent: [ ^aRequest sendResponseCode: 404 content: '' type: nil close: false ]) value: aRequest ]
		on: Error
		do: [ :error | aRequest sendResponseCode: 500 content: 'Internal Server Error' type: nil close: false ]! !

!StreamDeckOfflineWebServer methodsFor: 'requesting' stamp: 'CAP 11/Oct/2026, 1:48:11 am (UTC)'!
post: aBody to: aPath authorization: anAuthorization

	| request |

	request := StreamDeckOfflineWebRequest carrying: aBody authorizedWith: anAuthorization.
	self deliver: request to: aPath.

	^request response! !

!StreamDeckOfflineWebServer methodsFor: 'accessing' stamp: 'CAP 11/Oct/2026, 9:48:43 pm (UTC)'!
listenerInterface

	"Like WebServer, nil until it is told to listen."

	^listenerInterface! !

!StreamDeckOfflineWebServer methodsFor: 'accessing' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
listenerPort

	"Like WebServer, nil until it is told to listen."

	^listenerPort! !

!StreamDeckOfflineWebServer class methodsFor: 'instance creation' stamp: 'CAP 11/Oct/2026, 5:43:41 pm (UTC)'!
withoutServices

	^self new initializeServing: Dictionary new! !

!StreamDeckServer methodsFor: 'initialization' stamp: 'CAP 12/Oct/2026, 12:11:08 am (UTC)'!
initializeAtPort: aPortNumber onInterface: anInterfaceAddress authenticatingWith: aToken evaluatingIn: aProcess servingWith: aWebServer

	portNumber := aPortNumber.
	interfaceAddress := anInterfaceAddress.
	token := aToken.
	evaluationProcess := aProcess.
	webServer := aWebServer! !

!StreamDeckServer methodsFor: 'serving' stamp: 'unknown 14/Oct/2026, 1:16:29 pm (UTC)'!
evaluateCodeFromRequest: aWebRequest

	^ evaluationProcess do: [
		[ aWebRequest send200Response:
			(Compiler evaluate: (UnicodeString fromUtf8Bytes: aWebRequest content asByteArray)) printString ]
			on: Error
			do: [ :error |
				self respondTo: aWebRequest withCode: 500 andContent: error description asUtf8Bytes ] ]! !

!StreamDeckServer methodsFor: 'serving' stamp: 'unknown 14/Oct/2026, 1:16:29 pm (UTC)'!
handleCodeEvaluationRequest: aWebRequest

	^ self ifAuthenticated: aWebRequest do: [
		self evaluateCodeFromRequest: aWebRequest ]! !

!StreamDeckServer methodsFor: 'serving' stamp: 'unknown 14/Oct/2026, 1:12:41 pm (UTC)'!
ifAuthenticated: aWebRequest do: aClosure

	(aWebRequest headerAt: 'Authorization') = ('Bearer ', token)
		ifTrue: aClosure
		ifFalse: [ self respondTo: aWebRequest withCode: 401 andContent: '' ]! !

!StreamDeckServer methodsFor: 'serving' stamp: 'unknown 14/Oct/2026, 12:50:16 pm (UTC)'!
respondTo: aWebRequest withCode: aResponseCode andContent: aResponseContent

	^ aWebRequest
		sendResponseCode: aResponseCode
		content: aResponseContent
		type: 'text/plain; charset=utf-8'
		close: false! !

!StreamDeckServer methodsFor: 'serving' stamp: 'unknown 14/Oct/2026, 1:10:47 pm (UTC)'!
start

	webServer
		addService: '/evaluations'
		action: [ :aWebRequest | self handleCodeEvaluationRequest: aWebRequest ];

		listenOn: portNumber interface: interfaceAddress! !

!StreamDeckServer methodsFor: 'serving' stamp: 'CAP 12/Oct/2026, 1:20:07 am (UTC)'!
stop

	webServer destroy ! !

!StreamDeckServer class methodsFor: 'instance creation' stamp: 'CAP 12/Oct/2026, 12:11:08 am (UTC)'!
atPort: aPortNumber onInterface: anInterfaceAddress authenticatingWith: aToken evaluatingIn: aProcess servingWith: aWebServer

	^self new
		initializeAtPort: aPortNumber
		onInterface: anInterfaceAddress
		authenticatingWith: aToken
		evaluatingIn: aProcess
		servingWith: aWebServer! !

!StreamDeckServer class methodsFor: 'instance creation' stamp: 'CAP 12/Oct/2026, 12:11:08 am (UTC)'!
atPort: aPortNumber onInterface: anInterfaceAddress authenticatingWith: aToken servingWith: aWebServer

	^self
		atPort: aPortNumber
		onInterface: anInterfaceAddress
		authenticatingWith: aToken
		evaluatingIn: StreamDeckUserInterfaceProcess new
		servingWith: aWebServer! !

!StreamDeckServer class methodsFor: 'class initialization' stamp: 'CAP 13/Oct/2026, 7:24:18 pm (UTC)'!
initialize

	Smalltalk
		addToStartUpList: self;
		addToShutDownList: self.
	self startThisServer! !

!StreamDeckServer class methodsFor: 'class initialization' stamp: 'CAP 13/Oct/2026, 8:21:06 pm (UTC)'!
unload

	self stopThisServer! !

!StreamDeckServer class methodsFor: 'system startup' stamp: 'CAP 13/Oct/2026, 8:21:06 pm (UTC)'!
restartThisServer

	self stopThisServer.
	self startThisServer! !

!StreamDeckServer class methodsFor: 'system startup' stamp: 'CAP 13/Oct/2026, 8:21:06 pm (UTC)'!
shutDown: isQuitting

	"Saving the image without quitting also runs the shut down list, and stopping the server then would leave it stopped."

	isQuitting ifTrue: [ self stopThisServer ]! !

!StreamDeckServer class methodsFor: 'system startup' stamp: 'CAP 13/Oct/2026, 7:54:28 pm (UTC)'!
startThisServer

	"The settings file is read on every start, so a token the Stream Deck plugin regenerated is taken."

	Socket initializeNetwork.
	ThisServer := (StreamDeckSettingsFile inHomeFolder: '~' asDirectoryEntry)
		serverOnInterface: #[127 0 0 1]
		servingWith: WebServer new.
	ThisServer start! !

!StreamDeckServer class methodsFor: 'system startup' stamp: 'CAP 13/Oct/2026, 8:21:06 pm (UTC)'!
startUp: isResuming

	"Saving the image without quitting also runs the start up list, with isResuming false, and the server is still running then.
	A server saved running in the image comes back listening on the port it had, so it is restarted to read the settings file again."

	isResuming ifTrue: [ self restartThisServer ]! !

!StreamDeckServer class methodsFor: 'system startup' stamp: 'CAP 13/Oct/2026, 8:21:06 pm (UTC)'!
stopThisServer

	ThisServer stop! !

!StreamDeckSettingsFile methodsFor: 'serving' stamp: 'CAP 12/Oct/2026, 12:11:09 am (UTC)'!
serverOnInterface: anInterfaceAddress servingWith: aWebServer

	| settings |

	file exists ifFalse: [ self storeANewToken ].
	settings := Json readFrom: file fileContents readStream.

	^StreamDeckServer
		atPort: (settings at: 'port')
		onInterface: anInterfaceAddress
		authenticatingWith: (settings at: 'token')
		servingWith: aWebServer! !

!StreamDeckSettingsFile methodsFor: 'initialization' stamp: 'CAP 11/Oct/2026, 3:17:33 am (UTC)'!
initializeStoredIn: aFile

	file := aFile! !

!StreamDeckSettingsFile methodsFor: 'storing' stamp: 'CAP 12/Oct/2026, 12:11:10 am (UTC)'!
storeANewToken

	"The file is created empty and made readable only by its owner before the token is written, so the token is never readable by anybody else."

	file fileContents: ''.
	file beReadableOnlyByOwner.
	file appendStreamDo: [ :stream | stream nextPutAll: '{"port":2847,"token":"', UUID new asString, '"}' ]! !

!StreamDeckSettingsFile class methodsFor: 'instance creation' stamp: 'CAP 12/Oct/2026, 12:11:08 am (UTC)'!
inHomeFolder: aHomeFolder

	^self new initializeStoredIn: aHomeFolder // '.cuisdeck.json'! !

!StreamDeckUserInterfaceProcess methodsFor: 'evaluating' stamp: 'CAP 12/Oct/2026, 12:11:11 am (UTC)'!
do: aClosure

	UISupervisor whenUIinSafeState: aClosure! !

!StreamDeckServerIntegrationTest methodsFor: 'running' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
setUp

	temporaryHomeFolder := (DirectoryEntry userBaseDirectory / 'StreamDeckServerIntegrationTest') assureExistence.
	webServer := WebServer new! !

!StreamDeckServerIntegrationTest methodsFor: 'running' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
tearDown

	webServer destroy.
	temporaryHomeFolder recursiveDelete! !

!StreamDeckServerIntegrationTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
testMissingSettingsFileIsCreatedOnDiskReadableOnlyByItsOwner

	| settingsFile |

	settingsFile := temporaryHomeFolder // '.cuisdeck.json'.
	(StreamDeckSettingsFile inHomeFolder: temporaryHomeFolder) serverOnInterface: #[127 0 0 1] servingWith: webServer.

	self assert: ((FileIOAccessor default fileMode: settingsFile pathName) printStringBase: 8) equals: '100600'! !

!StreamDeckServerIntegrationTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:53:21 pm (UTC)'!
testServerCreatedFromASettingsFileOnDiskEvaluatesCodeSentByStreamDeckOverTheNetwork

	| response |

	(temporaryHomeFolder // '.cuisdeck.json') fileContents: '{"port":0,"token":"file-secret"}'.
	((StreamDeckSettingsFile inHomeFolder: temporaryHomeFolder) serverOnInterface: #[127 0 0 1] servingWith: webServer) start.

	response := WebClient httpDo: [ :client |
		client
			httpPost: 'http://127.0.0.1:', webServer listenerSocket localPort printString, '/evaluations'
			content: '3 + 4' asUtf8Bytes
			type: 'text/plain;charset=UTF-8'
			do: [ :request | request headerAt: 'Authorization' put: 'Bearer file-secret' ] ].

	self assert: response content equals: '7'! !

!StreamDeckServerIntegrationTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:48:43 pm (UTC)'!
testServerCreatedFromASettingsFileOnDiskListensOnlyOnTheGivenInterface

	(temporaryHomeFolder // '.cuisdeck.json') fileContents: '{"port":0,"token":"file-secret"}'.

	((StreamDeckSettingsFile inHomeFolder: temporaryHomeFolder) serverOnInterface: #[127 0 0 1] servingWith: webServer) start.

	self assert: webServer listenerSocket localAddress equals: #[127 0 0 1]! !

!StreamDeckServerIntegrationTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:30:24 pm (UTC)'!
testStoppedServerNoLongerAcceptsConnections

	| streamDeckServer port |

	(temporaryHomeFolder // '.cuisdeck.json') fileContents: '{"port":0,"token":"file-secret"}'.
	streamDeckServer := (StreamDeckSettingsFile inHomeFolder: temporaryHomeFolder) serverOnInterface: #[127 0 0 1] servingWith: webServer.
	streamDeckServer start.
	port := webServer listenerSocket localPort.

	streamDeckServer stop.

	self assert: (self outcomeOfPostingTo: port) equals: 'refused'! !

!StreamDeckServerIntegrationTest methodsFor: 'requesting' stamp: 'CAP 11/Oct/2026, 9:19:51 pm (UTC)'!
outcomeOfPostingTo: aPortNumber

	^[ 'answered ', (WebClient httpPost: 'http://127.0.0.1:', aPortNumber printString, '/evaluations' content: '' type: 'text/plain') code printString ]
		on: ConnectionRefused
		do: [ :error | 'refused' ]! !

!StreamDeckServerTest methodsFor: 'running' stamp: 'CAP 12/Oct/2026, 12:10:17 am (UTC)'!
setUp

	offlineWebServer := StreamDeckOfflineWebServer withoutServices.
	streamDeckServer := StreamDeckServer
		atPort: 9999
		onInterface: #[127 0 0 1]
		authenticatingWith: 'secret'
		evaluatingIn: StreamDeckInstantUserInterfaceProcess new
		servingWith: offlineWebServer.
	streamDeckServer start! !

!StreamDeckServerTest methodsFor: 'running' stamp: 'CAP 11/Oct/2026, 5:32:25 pm (UTC)'!
tearDown

	Smalltalk removeKey: #StreamDeckProbe ifAbsent: []! !

!StreamDeckServerTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:53:21 pm (UTC)'!
testCodeSentByStreamDeckIsEvaluatedAndItsResultIsAnswered

	| responseToAnAddition responseToAMultiplication |

	responseToAnAddition := self responseToEvaluating: '3 + 4'.
	responseToAMultiplication := self responseToEvaluating: '6 * 9'.

	self assert: responseToAnAddition code equals: 200.
	self assert: responseToAnAddition content equals: '7'.
	self assert: responseToAMultiplication content equals: '54'! !

!StreamDeckServerTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:53:21 pm (UTC)'!
testCodeSentByStreamDeckIsEvaluatedInTheUIProcess

	streamDeckServer := StreamDeckServer atPort: 2847 onInterface: #[127 0 0 1] authenticatingWith: 'secret' servingWith: offlineWebServer.
	streamDeckServer start.

	self assert: (self responseToEvaluating: 'UISupervisor isUIProcess: Processor activeProcess') content equals: 'true'! !

!StreamDeckServerTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:54:18 pm (UTC)'!
testCodeSentByStreamDeckIsReadAsUtf8

	self assert: (self responseToEvaluating: '''€'' size') content equals: '1'! !

!StreamDeckServerTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:53:21 pm (UTC)'!
testCodeSentByStreamDeckThatFailsIsAnsweredWithItsErrorDescription

	| responseToADivisionByZero responseToAnUnknownMessage |

	responseToADivisionByZero := self responseToEvaluating: '3 / 0'.
	responseToAnUnknownMessage := self responseToEvaluating: 'nil foo'.

	self assert: responseToADivisionByZero code equals: 500.
	self assert: responseToADivisionByZero content equals: 'ZeroDivide'.
	self assert: responseToAnUnknownMessage content equals: 'MessageNotUnderstood: UndefinedObject>>foo'! !

!StreamDeckServerTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:53:21 pm (UTC)'!
testCodeSentByStreamDeckWithAWrongTokenIsRejectedWithoutBeingEvaluated

	self assert: (self responseToEvaluating: 'Smalltalk at: #StreamDeckProbe put: true' authenticatingWith: 'wrong') code equals: 401.
	self assert: (self responseToEvaluating: 'Smalltalk includesKey: #StreamDeckProbe') content equals: 'false'! !

!StreamDeckServerTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:01:42 pm (UTC)'!
testEachMissingSettingsFileIsCreatedWithItsOwnToken

	| oneHomeFolder anotherHomeFolder tokenOfOneHome tokenOfAnotherHome |

	oneHomeFolder := StreamDeckInMemoryFolder empty.
	anotherHomeFolder := StreamDeckInMemoryFolder empty.

	(StreamDeckSettingsFile inHomeFolder: oneHomeFolder) serverOnInterface: #[127 0 0 1] servingWith: offlineWebServer.
	(StreamDeckSettingsFile inHomeFolder: anotherHomeFolder) serverOnInterface: #[127 0 0 1] servingWith: offlineWebServer.
	tokenOfOneHome := self tokenStoredIn: oneHomeFolder.
	tokenOfAnotherHome := self tokenStoredIn: anotherHomeFolder.

	self
		deny: tokenOfOneHome = tokenOfAnotherHome
		description: 'One home folder stores the token ', tokenOfOneHome printString, ' and another one ', tokenOfAnotherHome printString! !

!StreamDeckServerTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:53:07 pm (UTC)'!
testErrorDescriptionIsAnsweredAsUtf8

	| response |

	response := self responseToEvaluating: 'self error: ''Costo: 5 €'''.

	self assert: response content asByteArray equals: 'Error: Costo: 5 €' asUtf8Bytes! !

!StreamDeckServerTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:54:51 pm (UTC)'!
testServerCreatedFromAMissingSettingsFileListensOnTheDefaultPortAndNobodyElseCanReadItsToken

	| homeFolder |

	homeFolder := StreamDeckInMemoryFolder empty.

	streamDeckServer := (StreamDeckSettingsFile inHomeFolder: homeFolder) serverOnInterface: #[127 0 0 1] servingWith: offlineWebServer.
	streamDeckServer start.

	self assert: offlineWebServer listenerPort equals: 2847.
	self assert: (homeFolder // '.cuisdeck.json') contentsEverReadableByOthers equals: ''! !

!StreamDeckServerTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 9:48:43 pm (UTC)'!
testServerCreatedFromASettingsFileListensOnTheGivenInterface

	| homeFolder webServerOfTheSettingsFile |

	homeFolder := StreamDeckInMemoryFolder empty.
	(homeFolder // '.cuisdeck.json') fileContents: '{"port":5001,"token":"file-secret"}'.
	webServerOfTheSettingsFile := StreamDeckOfflineWebServer withoutServices.

	((StreamDeckSettingsFile inHomeFolder: homeFolder) serverOnInterface: #[127 0 0 1] servingWith: webServerOfTheSettingsFile) start.

	self assert: webServerOfTheSettingsFile listenerInterface equals: #[127 0 0 1]! !

!StreamDeckServerTest methodsFor: 'tests' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
testServerCreatedFromASettingsFileListensOnTheSpecifiedPortAndRequiresTheSpecifiedToken

	| homeFolder |

	homeFolder := StreamDeckInMemoryFolder empty.
	(homeFolder // '.cuisdeck.json') fileContents: '{"port":5001,"token":"file-secret"}'.

	streamDeckServer := (StreamDeckSettingsFile inHomeFolder: homeFolder) serverOnInterface: #[127 0 0 1] servingWith: offlineWebServer.
	streamDeckServer start.

	self assert: offlineWebServer listenerPort equals: 5001.
	self assert: (self responseToEvaluating: '3 + 4' authenticatingWith: 'file-secret') content equals: '7'! !

!StreamDeckServerTest methodsFor: 'evaluating' stamp: 'CAP 5/Oct/2026, 3:24:09 am (UTC)'!
responseToEvaluating: aSourceCode

	^self responseToEvaluating: aSourceCode authenticatingWith: 'secret'! !

!StreamDeckServerTest methodsFor: 'evaluating' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
responseToEvaluating: aSourceCode authenticatingWith: aToken

	"The Stream Deck plugin sends the code encoded as UTF-8, so it arrives with one character per byte."

	^offlineWebServer
		post: aSourceCode asUtf8Bytes asString
		to: '/evaluations'
		authorization: 'Bearer ', aToken! !

!StreamDeckServerTest methodsFor: 'evaluating' stamp: 'CAP 11/Oct/2026, 8:38:02 pm (UTC)'!
tokenStoredIn: aHomeFolder

	^(Json readFrom: (aHomeFolder // '.cuisdeck.json') fileContents readStream) at: 'token'! !

!FileEntry methodsFor: '*StreamDeck' stamp: 'CAP 12/Oct/2026, 12:11:11 am (UTC)'!
beReadableOnlyByOwner

	FileIOAccessor default primitiveChangeMode: self pathName asUtf8Bytes mode: 8r600! !
StreamDeckServer initialize!
