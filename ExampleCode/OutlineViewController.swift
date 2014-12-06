//
//  OutlineViewController.swift
//  ExampleCode
//
//  Created by Steven Marlowe on 11/27/14.
//  Copyright (c) 2014 Steven Marlowe. All rights reserved.
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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