//
//
//  BookController.swift
//  Raindow
//
//  Created by Drew Miller on 5/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    
    var books: [Book] = []
    
    func createBook(title: String, reasonToRead: String, hasBeenRead: Bool) {
        let book = Book(title: title, reasonToRead: reasonToRead)
    
        books.append(book)
        
    }
    
    func deleteBook(_ : Book) {
    
        
    
    }
    
    var readListURL: URL? {
        
        let fileManager = FileManager.default
        
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let bookURL = documentsDir?.appendingPathComponent("readingList.plist")
        
        return bookURL
    }
    
    func saveToPersistentStore() {
        
        do {
            
            guard let readListURL = readListURL else { return }
            
            //This is the machine that we can run our array of stars through that turns it into a property list
            let encoder = PropertyListEncoder()
            // Try to turn the stars into a property list
            let readingPlist = try encoder.encode(books)
            // Save the stars plist to the location that we specified in the persistentFileURL
            try readingPlist.write(to: readListURL)
            
        } catch {
            print("Error saving star \(error)")
            
        }
        
    }
    
    func loadFromPersistentStore() {
        
        do {
            
            guard let readListURL = readListURL else { return }
            
            let readingPlist = try Data(contentsOf: readListURL)
            
            let decoder = PropertyListDecoder()
            
            let decodedBooks = try decoder.decode([Book].self, from: readingPlist)
            
        } catch {
            
            print("Error loading stars from plist: \(error)")
        }
            
        }
        
    }

