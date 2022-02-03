//
//  User.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 02.02.2022.
//

import Foundation

struct User {
    let user: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(user: "User",
             password: "Password",
             person: Person(name: "Nikolay",
                            surname: "Trofimov",
                            about: "Hi there! My name is Nikolay!\n" +
                            "I was born November 19, 1985 in Moscow.\n" +
                            "After graduating from school I entered the University of Communications and Informatics. " +
                            "Currently work for a Swedish 5G telecommunications company. " +
                            "I'm interested in mobile development with Swift.\n",
                            photo: "Nikk"))
    }
}

struct Person {
    let name: String
    let surname: String
    let about: String
    let photo: String
}
