//
//  Models.swift
//  BookSwift
//
//  Created by Khakim on 02/11/23.
//

import Foundation
import SwiftUI

struct DataModel: Decodable{
    let error: Bool
    let message: String
    let data: [PostModel]
}

struct PostModel: Decodable{
    let id: Int
    let title: String
    let post: String
}
