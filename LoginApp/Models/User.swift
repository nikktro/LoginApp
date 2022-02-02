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
}

struct Person {
    let name: String
    let surname: String
    let about: String
    let photo: String
}
