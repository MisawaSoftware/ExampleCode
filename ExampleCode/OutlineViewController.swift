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
        people.append(Person.init(personName:"Ted", personAge:22))
 
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
        println("Checking if children")
        println(item)
        
        
        if item is Person
        {
            let per = item as Person
            println(per.children)
            if per.children.count != 0
            {
                return true
            }
        }
        
        return false
      

    }
    
    func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject
    {
        println("Printing item")
        println(item)
        println("Printing child index")
        println(index)
        
        if item is Person
        {
            let per = item as Person
            return per.children[index]
        }
        
        return people[index]
    }
    
    func outlineView(outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem item: AnyObject?) -> AnyObject?
    {
        println("Printing item at objectvaluefortablecolumn")
        println(item)
        if(item is Person)
        {
            if tableColumn?.identifier == "name"
            {
            return (item as Person).name
            }
            if tableColumn?.identifier == "age"
            {
                return (item as Person).age
            }
        }
        return "Oops"
    }
    
    
}