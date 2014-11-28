//  This is based on Cocoa Programming L49 - NSOutlineView by AppleProgramming on YouTube

import Foundation

class Person: NSObject
{
    var name: String
    var age: Int
    var children: [Person] = []
    
    func addChild(P: Person)
    {
        children.append(P)
    }
    
    func toString() -> NSString
    {
        return name
    }
    
    init(personName: String, personAge: Int)
    {
        name = personName
        age = personAge
        
        super.init()
     
    }
    
}