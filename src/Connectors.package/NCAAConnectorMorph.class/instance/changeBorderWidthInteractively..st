menus
changeBorderWidthInteractively: evt
	"Copied from BorderedMorph"
	| handle origin aHand newWidth oldWidth |
	aHand _ evt ifNil: [self primaryHand] ifNotNil: [evt hand].
	origin _ aHand position.
	oldWidth _ self borderWidth.
	handle _ HandleMorph new
		forEachPointDo:
			[:newPoint | handle removeAllMorphs.
			handle addMorph:
				(LineMorph from: origin to: newPoint color: Color black width: 1).
			newWidth _ (newPoint - origin) r / 10.0.
			self borderWidth: (newWidth max: 0)]
		lastPointDo:
			[:newPoint | handle deleteBalloon.
			self halo ifNotNilDo: [:halo | halo addHandles].
			self rememberCommand:
				(Command new cmdWording: 'border change';
					undoTarget: self selector: #borderWidth: argument: oldWidth;
					redoTarget: self selector: #borderWidth: argument: newWidth)].
	aHand attachMorph: handle.
	handle setProperty: #helpAtCenter toValue: true.
	handle showBalloon:
'Move cursor farther from
this point to increase border width.
Click when done.' hand: evt hand.
	handle startStepping