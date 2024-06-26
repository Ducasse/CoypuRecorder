"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  The recorder of performance .

For the Responsibility part: Decorator of Performance used to record the performance.

For the Collaborators Part: Decorator of Performance
									Using RecordedCommand in the OrderedCollection savedPerformance.

Public API and Key Messages

- Use it has a performance and it will save every command used in savedPerformance.
- You can get those command in a txt file via the message ""writeScriptInTxtFile""
- PerformanceRecorder is a singleton so you can get access to it via the line ""PerformanceRecorder uniqueInstance"".

 Exemple of use : 
""This exemple do a little performance and display the command used in the transcript.""
p := PerformanceRecorder uniqueInstance.
p performer: PerformerSuperDirt new.
16 upbeats to: #bd.
p playFor 12 bars.
p scriptInTranscript

Internal Representation and Key Implementation Points.

    Instance Variables
	announcer:		<Announcer> Used to save the command and to stock them in savedPerformance>
	savedPerformance:		<OrderedCollection> OrderedCollection where the commands used are saved as RecordedCommand objects.


    Implementation Points
"
Class {
	#name : #PerformanceRecorder,
	#superclass : #Object,
	#type : #variable,
	#instVars : [
		'savedPerformance',
		'announcer'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'CoypuRecorder-Recorder'
}

{ #category : #'instance creation' }
PerformanceRecorder class >> new [

	^ Error new signal:
		  'PerformanceRecorder is a singleton -- Use unique instance instead'
]

{ #category : #accessing }
PerformanceRecorder class >> uniqueInstance [

	^ uniqueInstance
		  ifNil: [ uniqueInstance := super new ]
]

{ #category : #accessing }
PerformanceRecorder >> Dictionary [

	^ Performance uniqueInstance dictionary
]

{ #category : #accessing }
PerformanceRecorder >> activeDSP [ 

^ Performance uniqueInstance activeDSP
]

{ #category : #accessing }
PerformanceRecorder >> activeDSP: aDSP [

Performance uniqueInstance activeDSP: aDSP
]

{ #category : #accessing }
PerformanceRecorder >> activeProcess [

	^Performance uniqueInstance activeProcess
]

{ #category : #accessing }
PerformanceRecorder >> activeProcess: anObject [

Performance uniqueInstance activeProcess: anObject
]

{ #category : #adding }
PerformanceRecorder >> add: aSequencer channel: anIntegerBetween1And16 [

Performance uniqueInstance add: aSequencer channel: anIntegerBetween1And16
]

{ #category : #accessing }
PerformanceRecorder >> announcer [

	^ announcer
]

{ #category : #accessing }
PerformanceRecorder >> at: key put: anObject [

Performance uniqueInstance at: key put: anObject
]

{ #category : #accessing }
PerformanceRecorder >> backup [

^	Performance uniqueInstance backup
]

{ #category : #accessing }
PerformanceRecorder >> backup: anObject [

	Performance uniqueInstance backup: anObject
]

{ #category : #accessing }
PerformanceRecorder >> bpm [

^	Performance uniqueInstance bpm
]

{ #category : #accessing }
PerformanceRecorder >> bpm: aRateInSeconds [

Performance uniqueInstance bpm: aRateInSeconds
]

{ #category : #accessing }
PerformanceRecorder >> canvas [

	^Performance uniqueInstance canvas
]

{ #category : #accessing }
PerformanceRecorder >> canvas: aRSCanvas [

Performance uniqueInstance canvas: aRSCanvas
]

{ #category : #accessing }
PerformanceRecorder >> dirtMIDIDevice [
	"select a SuperDirt MIDI device for the Performance"

	^Performance uniqueInstance dirtMIDIDevice
]

{ #category : #accessing }
PerformanceRecorder >> dirtMIDIDevice: aString [
	"select a SuperDirt MIDI device for the Performance"
	
Performance uniqueInstance dirtMIDIDevice: aString
]

{ #category : #'accessing - structure variables' }
PerformanceRecorder >> freq [
	^ Performance uniqueInstance freq
]

{ #category : #accessing }
PerformanceRecorder >> freq1: anObject [

Performance uniqueInstance freq1: anObject
]

{ #category : #accessing }
PerformanceRecorder >> freq: aDurationInSeconds [

	savedPerformance add: (RecordedOrderCommand new order:
			 'freq: ' , (1 / (4 * aDurationInSeconds) * 60) asInteger asString
			 , ' bpm.').
	Performance uniqueInstance freq: aDurationInSeconds
]

{ #category : #'LiveCoding - Performance' }
PerformanceRecorder >> incrementTransportStep [

	Performance uniqueInstance incrementTransportStep 
]

{ #category : #initialization }
PerformanceRecorder >> initialize: aSize [

Performance uniqueInstance initialize: aSize
]

{ #category : #testing }
PerformanceRecorder >> isPerformance [ 

Performance uniqueInstance isPerformance
]

{ #category : #accessing }
PerformanceRecorder >> length [

Performance uniqueInstance length
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> mute: aKeyOrAnArrayOfKeys [

	Performance uniqueInstance mute: aKeyOrAnArrayOfKeys.
	savedPerformance
		add:( RecordedOrderCommand new order: 'mute: ' , '#' , aKeyOrAnArrayOfKeys asString , '.').
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> muteAll [

	savedPerformance
		add:( RecordedOrderCommand new
		order: 'muteAll.').
	Performance uniqueInstance muteAll
		
]

{ #category : #'LiveCoding - satelliteEvent' }
PerformanceRecorder >> pacaDance [
"NE FONCTIONNE PAS"
	savedPerformance add: (RecordedOrderCommand new order: 'pacaDance').

	"Performance uniqueInstance pacaDance"
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> performer [

	^Performance uniqueInstance performer
]

{ #category : #accessing }
PerformanceRecorder >> performer: aPerformer [

	savedPerformance := SavedPerformance new.
	announcer := Announcer new.
	announcer
		when: RythmAnnouncement
		send: #addInstrument:
		to: savedPerformance.
	announcer
		when: SymbolAnnouncement
		send: #lastSymbol:
		to: savedPerformance.
	announcer
		when: DirtNotesAnnouncement
		send: #lastDirtNotes:
		to: savedPerformance.

	Performance uniqueInstance  performer: aPerformer
]

{ #category : #playing }
PerformanceRecorder >> play [
	"NE FONCTIONNE PAS"

	savedPerformance add: (RecordedOrderCommand new order: 'play.').
	"Performance uniqueInstance play"
]

{ #category : #playing }
PerformanceRecorder >> playFor: aNumberOfSteps [

	savedPerformance add: (RecordedOrderCommand new order:
			 'playFor: ' , (aNumberOfSteps / 16) asString , ' bars.').
	Performance uniqueInstance playFor: aNumberOfSteps
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> playKymaSequencFor: aNumberOfSteps [

Performance uniqueInstance playKymaSequencFor: aNumberOfSteps
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> playKymaSequenceAt: aRateInSeconds for: aNumberOfSteps [

	Performance uniqueInstance playKymaSequenceAt: aRateInSeconds for: aNumberOfSteps
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> playLocalSequenceAt: aRateInSeconds for: aNumberOfSteps [

	Performance uniqueInstance
		playLocalSequenceAt: aRateInSeconds
		for: aNumberOfSteps
]

{ #category : #removing }
PerformanceRecorder >> remove: aKey [

Performance uniqueInstance remove: aKey
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> resetAllSequencers [ 

Performance uniqueInstance resetAllSequencers 
]

{ #category : #accessing }
PerformanceRecorder >> restore [

	savedPerformance add: (RecordedOrderCommand new order: 'restore.').
	Performance uniqueInstance restore
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> rsGroupDictionary [

	^Performance uniqueInstance rsGroupDictionary
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> rsGroupDictionary: anRSGroupDictionary [

 Performance uniqueInstance rsGroupDictionary: anRSGroupDictionary  
]

{ #category : #accessing }
PerformanceRecorder >> savedPerformance [

	^ savedPerformance
]

{ #category : #'as yet unclassified' }
PerformanceRecorder >> scriptForDisplayer: aDisplayer [

savedPerformance scriptListForDisplayer: aDisplayer
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> solo: aKeyOrAnArrayOfKeys [

	Performance uniqueInstance solo: aKeyOrAnArrayOfKeys.
	savedPerformance add: (RecordedOrderCommand new order:
			 'solo: ' , '#' , aKeyOrAnArrayOfKeys asString , '.')
]

{ #category : #accessing }
PerformanceRecorder >> stop [

	savedPerformance add: (RecordedOrderCommand new order: 'stop.').
	Performance uniqueInstance stop
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> swap: firstKey with: secondKey [

Performance uniqueInstance swap: firstKey with: secondKey
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> transportStep [

	^Performance uniqueInstance transportStep
]

{ #category : #'muting and soloing' }
PerformanceRecorder >> transportStep: anInteger [

Performance uniqueInstance transportStep: anInteger
]

{ #category : #'LiveCoding - Performance' }
PerformanceRecorder >> unsolo: aKeyOrAnArrayOfKeys [

	Performance uniqueInstance unsolo: aKeyOrAnArrayOfKeys.
	savedPerformance add: (RecordedOrderCommand new order:
			 'unsolo: ' , '#' , aKeyOrAnArrayOfKeys asString , '.')
]

{ #category : #accessing }
PerformanceRecorder >> visualization [

^	Performance uniqueInstance visualization
]

{ #category : #accessing }
PerformanceRecorder >> visualization: anObject [

Performance uniqueInstance visualization: anObject 
]
