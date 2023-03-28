//
//  ErrorMesage.swift
//  githubFollowersApp
//
//  Created by deniz on 28.03.2023.
//

import Foundation

enum GFError:String,Error {
    case invalidUsername = "the username dosen't found it"
    case unableToComplete = "unable to complete your request.please check your internet connection"
    case invalidResponse = "the response went wrong"
    case invalidData = "The data recived from the server was invalid.Please try again"
}
