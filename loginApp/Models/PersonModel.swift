//
//  PersonModel.swift
//  loginApp
//
//  Created by o11ev on 07.02.2021.
//
import UIKit

struct User {
    let username: String
    let password: String
    let personData: Person
}

struct Person {
    let firstName: String
    let lastName: String
    let age: Int
    let currentWork: String
    let photo: UIImage
}
