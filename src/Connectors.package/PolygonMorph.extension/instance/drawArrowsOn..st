*connectors-drawing
drawArrowsOn: aCanvas 
	"Answer (possibly modified) endpoints for border drawing"
	"ArrowForms are computed only upon demand"
	| array |

	(closed or: [vertices size < 2])
		ifTrue: [^ #() ].
	"Nothing to do"

	array _ Array with: vertices first with: vertices last.

	"Prevent crashes for #raised or #inset borders"
	borderColor isColor
		ifFalse: [ ^array ].

	(arrows == #forward or: [arrows == #both])
		ifTrue: [ array at: 2 put: (self
				drawArrowOn: aCanvas
				at: vertices last
				from: self nextToLastPoint) ].

	(arrows == #back or: [arrows == #both])
		ifTrue: [ array at: 1 put: (self
				drawArrowOn: aCanvas
				at: vertices first
				from: self nextToFirstPoint) ].

	^array