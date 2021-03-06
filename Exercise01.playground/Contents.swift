class Person {
    var name: String
    var surname: String
    var age: Int
    var nickname: String?
    
    init(name: String, surname: String, age: Int, nickname: String? = nil) {
        self.name = name
        self.surname = surname
        self.age = age
        self.nickname = nickname
    }
}

let person = Person(name: "Mattia", surname: "Fasoli", age: 23)

// Exercise 06

var personsArray = [
    Person(name: "Andrea", surname: "Andrei", age: 20, nickname: "Andre"),
    Person(name: "Bruna", surname: "Bruni", age: 50, nickname: "Brubru"),
    Person(name: "Carlo", surname: "Carli", age: 30),
    Person(name: "Daniela", surname: "Danieli", age: 40, nickname: "Dan")
]

// Exercise 07

func printPerson(person: Person) {
    if person.nickname != nil {
        print("\(person.name) \(person.surname) ha \(person.age) anni e il suo nickname è \(person.nickname!)")
    } else {
        print("\(person.name) \(person.surname) ha \(person.age) anni")
    }
}

printPerson(person: personsArray[0])

func printPersons(personsArray: [Person]) {
    for person in personsArray {
        if person.nickname != nil {
            print("\(person.name) \(person.surname) ha \(person.age) anni e il suo nickname è \(person.nickname!)")
        } else {
            print("\(person.name) \(person.surname) ha \(person.age) anni")
        }
    }
}

printPersons(personsArray: personsArray)

// Exercise 08

// Exercise 08 (Parte A)

func filterUnder30Persons(personsArray: [Person]) -> [Person] {
    var under30PersonsArray: [Person] = []
    for person in personsArray {
        if person.age <= 30 {
            under30PersonsArray.append(person)
        }
    }
    return under30PersonsArray
}

filterUnder30Persons(personsArray: personsArray)

func filterUnder40Persons(personsArray: [Person]) -> [Person] {
    var under40PersonsArray: [Person] = []
    for person in personsArray {
        if person.age <= 40 {
            under40PersonsArray.append(person)
        }
    }
    return under40PersonsArray
}

filterUnder40Persons(personsArray: personsArray)

func filterNicknamePersons(personsArray: [Person]) -> [Person] {
    var nicknamePersonsArray: [Person] = []
    for person in personsArray {
        if person.nickname != nil {
            nicknamePersonsArray.append(person)
        }
    }
    return nicknamePersonsArray
}

filterNicknamePersons(personsArray: personsArray)

// Exercise 08 (Parte B)

typealias filterCondition = (Person) -> Bool

func conditionUnder30(person: Person) -> Bool {
    return person.age <= 30
}

func conditionUnder40(person: Person) -> Bool {
    return person.age <= 40
}

func conditionNickname(person: Person) -> Bool {
    return person.nickname != nil
}

func filterPersons(condition: filterCondition, personsArray: [Person]) -> [Person] {
    var filterPersonArray: [Person] = []
    for person in personsArray where condition(person) {
        filterPersonArray.append(person)
    }
    return filterPersonArray
}

filterPersons(condition: conditionUnder30, personsArray: personsArray)
filterPersons(condition: conditionUnder40, personsArray: personsArray)
filterPersons(condition: conditionNickname, personsArray: personsArray)

filterPersons(condition: {$0.age <= 30}, personsArray: personsArray)
filterPersons(condition: {$0.age <= 40}, personsArray: personsArray)
filterPersons(condition: {$0.nickname != nil}, personsArray: personsArray)

// Exercise 8 (Parte c)

personsArray.filter({$0.age <= 30})
personsArray.filter({$0.age <= 30})
personsArray.filter({$0.nickname != nil})

// Exercise 9

var persons: String = ""

for element in personsArray {
    persons = persons + "\(element.name) \(element.surname) "
}

print(persons)

// Exercise 10

print(personsArray.map{$0.name + " " + $0.surname}.reduce("", {$0 + $1 + " "}))

// Exercise 11

print(personsArray.map{$0.surname})
print(personsArray.map{$0.surname}.map{$0.count}.reduce(0, {$0 > $1 ? $0:$1}))
print(personsArray.map{$0.surname}.reduce("", {$0.count > $1.count ? $0:$1}))
print(personsArray.map{$0.name + $0.surname}.reduce("", {$0.count > $1.count ? $0:$1}))
print(personsArray.compactMap{$0.nickname}.map{$0.count}.reduce(0, {$0 + $1}))
print(personsArray.map{$0.surname}.map{$0.count}.reduce(0.0, {Double($0) + Double($1)})/Double(personsArray.count))
