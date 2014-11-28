//
//  OutlineViewController.swift
//  ExampleCode
//
//  Created by Steven Marlowe on 11/27/14.
//  Copyright (c) 2014 Steven Marlowe. All rights reserved.
//

import Foundation
import Cocoa

class OutlineViewController: NSObject, NSOutlineViewDataSource
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
        let p: [Person] = item as [Person]
        return !(item != nil) ? self.people.count : p.count //Possible bug
        
    }
    
    func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool
    {
        var p: Person = item as Person
        if p.children.count > 0
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func outlineView(outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem item: AnyObject?) -> AnyObject?
    {
        if let theItem: AnyObject = item
        {
            let tmpfsItem: Person = item as Person
            return tmpfsItem.name
        }
        return "Empyty"
    }
    
}