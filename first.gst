Object subclass: Person [
    | name age |
    <comment:'I represent a person'>
    Person class >> new [
        | obj |
        <category: 'instance creation'>
        'Consider using name:age:' printNl.
        obj := super new.
        obj name: ''.
        obj age: 0.
        ^obj
    ]
    Person class >> name: n age: a [
        | obj |
        <category: 'instance creation'>
        obj := super new.
        obj name: n.
        obj age: a.
        ^obj.
    ]
    printOn: stream [
        <category: 'printing'>
        super printOn: stream.
        stream nextPutAll: ' named '.
        name printOn: stream.
        stream nextPutAll: ', aged '.
        age printOn: stream.
        stream nextPutAll: '.'.
    ]
    name [
        <category: 'getter'>
        ^name. 
    ]
    age [
        <category: 'getter'>
        ^age.
    ]
    name: val [
        <category: 'setter'>
        name := val.
    ]
    age: val [
        <category: 'setter'>
        age := val.
    ]
    happyBirthday [
        <category: 'aging'>
	| message |
	message := 'Happy Birthday, ', name, '!'.
	message printNl.
	age := age + 1.
    ]
]
people := Array new: 10.
person := Person name: 'Peter' age: 11.
people at: 1 put: person.
person := Person name: 'Person 1' age: 30.
people at: 2 put: person.
people do: [ :person | 
  person isNil
    ifFalse: [ person printNl]. 
].
'After one year:' printNl.
people do: [ :person | 
  person isNil
    ifFalse: [ person happyBirthday]. 
].
people do: [ :person |
  person isNil
    ifFalse: [ person printNl].
].
