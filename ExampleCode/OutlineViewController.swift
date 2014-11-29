//
//  OutlineViewController.swift
//  ExampleCode
//
//  Created by Steven Marlowe on 11/27/14.
//  Copyright (c) 2014 Steven Marlowe. All rights reserved.
//

import Foundation
import Cocoa

class SAM_OutlineViewController: NSObject, NSOutlineViewDataSource, NSOutlineViewDelegate
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
      
        return false
        
        if item as NSString == "Item is empty"
        {
            return false
        }
        else
        {
            println("Item is not empty")
            return false
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
        
        return people[0]
    }
    
    func outlineView(outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem item: AnyObject?) -> AnyObject?
    {
        println("Printing item")
        println(item)
        if(item is Person)
        {
            return (item as Person).name
        }
        return "Oops"
    }
    
    
}