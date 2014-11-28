//
//  OutlineViewController.swift
//  ExampleCode
//
//  Created by Steven Marlowe on 11/27/14.
//  Copyright (c) 2014 Steven Marlowe. All rights reserved.
//

import Foundation
import Cocoa

class SAM_OutlineViewController: NSObject, NSOutlineViewDataSource
{
    var people: [Person] = []
    var boss: Person = Person.init(personName: "Steve", personAge: 30)
    
     override init()
    {
        super.init()
        setup()
        
    }
    
    func setup()
    {
        boss.addChild(Person.init(personName: "Stan", personAge: 5))
        boss.addChild(Person.init(personName: "Brad", personAge: 17))
        boss.addChild(Person.init(personName: "Sal", personAge: 55))
        
        for x in boss.children
        {
            let y = x as Person
            println(y.toString())
            
        }
        
        people.append(boss)
 
    }

    // MARK: NSOutlineView Data Source Methods
    func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: AnyObject?) -> Int
    {
        
        if item == nil
        {
        return  self.people.count
        }
        else
        {
            let i = item as Person
            return i.children.count
            
        }
    }
    
    func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool
    {
        println("Checking if expandable")
        println(item)
      
        if item as NSString == "Item is empty"
        {
            return false
        }
        else
        {
            println("Item is not empty")
            return true
        }

    }
    
    func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject
    {
        println("Printing item")
        println(item)
        println("Printing child index")
        println(index)
        
        if item != nil
        {

            return item!
        }
        
        return "Item is empty"
    }
    
    func outlineView(outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem item: AnyObject?) -> AnyObject?
    {
    
        
            if tableColumn?.identifier == "name"
            {
                println("Returning name")
                println(item)
               // var x = item as Person
                return "name"
            }
        
            if tableColumn?.identifier == "age"
            {
                println("Returning age")
               
                println(item)
                // var x = item as Person
                return "1"
            }
            println("returning empty")
            return "Empty"
        /*
        if let theItem: AnyObject = item
        {
            let tmpfsItem: Person = item as Person
            return tmpfsItem.name
        }
        return "Empyty"
*/
    }
    
    
}