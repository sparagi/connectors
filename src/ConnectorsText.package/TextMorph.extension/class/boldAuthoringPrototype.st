*connectorstext-parts bin
boldAuthoringPrototype
	"TextMorph boldAuthoringPrototype openInHand"
	| text |
	text := Text string: 'Text' translated attributes: { TextEmphasis bold. }.
	^self new
		contentsWrapped: text;
		fontName: 'BitstreamVeraSans' pointSize: 24;
		paragraph;
		margins: 4@0;
		extent: 79@36;
		fit;
		yourself