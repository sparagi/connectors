prototypes
prototype: aMorph
	"Store a copy of the given morph as a prototype to be copied to make new instances."

	aMorph ifNil: [prototype _ nil. ^ self].
	prototype _ aMorph asButtonPrototype.