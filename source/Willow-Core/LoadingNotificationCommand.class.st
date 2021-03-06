"
I'm a WebInteractionCommand that displays a Loading... notification while an AJAX call is beign executed.
"
Class {
	#name : #LoadingNotificationCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'serverIndependentActions',
		'modelLoadingActions'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
LoadingNotificationCommand class >> displaying: aWebView applying: aComponentCommand [

	^ self
		executing:
			(Array
				with: [ :aScript :aCanvas | 
					aScript << (aCanvas jQuery id: Constants >> #willow >> #notificationSectionName)
						html: [ :aSubCanvas | 
							aSubCanvas render:
								(GenericContainerWebView wrapping: aWebView applying: aComponentCommand) ] ])
		then:
			(Array
				with: [ :aScript :aCanvas | 
					aScript << (aCanvas jQuery id: Constants >> #willow >> #notificationSectionName)
						html: [ :aSubCanvas |  ] ])
]

{ #category : #'instance creation - private' }
LoadingNotificationCommand class >> executing: aServerIndependentActionCollection then: aModelLoadingActionCollection [

	^self new initializeExecuting: aServerIndependentActionCollection
		then: aModelLoadingActionCollection
]

{ #category : #'instance creation' }
LoadingNotificationCommand class >> onPageTopWithClasses: aCssClassCollection [

	^ self
		displaying: 'Loading...'
		applying: (ComponentClassificationCommand toStyleWithAll: aCssClassCollection)
]

{ #category : #accessing }
LoadingNotificationCommand >> clientIndependentActions [

	^#()
]

{ #category : #'initialize-release' }
LoadingNotificationCommand >> initializeExecuting: aServerIndependentActionCollection then: aModelLoadingActionCollection [

	serverIndependentActions := aServerIndependentActionCollection.
	modelLoadingActions := aModelLoadingActionCollection
]

{ #category : #accessing }
LoadingNotificationCommand >> modelLoadingActions [

	^modelLoadingActions
]

{ #category : #accessing }
LoadingNotificationCommand >> priorityActions [

	^#()
]

{ #category : #testing }
LoadingNotificationCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
LoadingNotificationCommand >> serverIndependentActions [

	^serverIndependentActions
]
