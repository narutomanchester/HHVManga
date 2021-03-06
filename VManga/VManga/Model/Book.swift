//
//  Book.swift
//  VManga
//
//  Created by mac on 3/10/17.
//  Copyright © 2017 mac. All rights reserved.
//

class Book {
    static let share = Book()
    
    var id : Int!
    var thumbnail : String!
    var title : String!
    var description : String!
    var category : [String]!
    
    init() {}
    init(id: Int, thumbnail: String, title: String) {
        self.id = id
        self.thumbnail = thumbnail
        self.title = title
    }
}
