//
//  User.swift
//  hw2.3
//
//  Created by Alisa Ts on 29.10.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(login: "User",
             password: "Password",
             person: Person(name: "Alisa",
                            surname: "Tsyganova",
                            greetings: "Hi guys!",
                            aboutOfPerson: "My name is Alisa, I live in the city of Nizhny Novgorod.",
                            hobby: "I love to draw and will make you a cool website design. We will also create a logo that meets the latest trends.",
                            exampleJob: "You can see my work on Behance.net and also there are a couple of works that you will definitely like."))
    }
    
}

struct Person {
    let name: String
    let surname: String
    let greetings: String
    let aboutOfPerson: String
    let hobby: String
    let exampleJob: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
