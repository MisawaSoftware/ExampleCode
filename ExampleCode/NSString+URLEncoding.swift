//
//  NSString+URLEncoding.swift
//  ExampleCode
//
//  Created by Steven Marlowe on 12/5/14.
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

import Foundation


//This is a class extension for NSString that adds URL encoding that will be needed for the geocoder class

extension NSString
{
    func encodedURLString() -> NSString
    {
        let result: NSString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, self, nil, "?=&+", CFStringEncoding())
        
        //CFURLCreateStringByAddingPercentEscapes(<#allocator: CFAllocator!#>, <#originalString: CFString!#>, <#charactersToLeaveUnescaped: CFString!#>, <#legalURLCharactersToBeEscaped: CFString!#>, <#encoding: CFStringEncoding#>)
        
        return result
    }

    func encodedURLParameterString() -> NSString
    
    {
        let result: NSString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, self, nil, ":/=,!$&'()*+;[]@#?", CFStringEncoding())
    
        return result
    }
    
    func decodedURLString() -> NSString
    {
        let result = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, self, nil, "", CFStringEncoding())
        
        return result
    }
    
    func removeQuotes() -> NSString
    {
        let length = self.length
        var ret = self
        let quote: NSString = "\""
        if self.characterAtIndex(0) == quote.characterAtIndex(0)
        {
            ret = ret.substringFromIndex(1)
        }
        if self.characterAtIndex(length-1) == quote.characterAtIndex(0)
        {
            ret = ret.substringToIndex(length - 2)
        }
        return ret
    }
}