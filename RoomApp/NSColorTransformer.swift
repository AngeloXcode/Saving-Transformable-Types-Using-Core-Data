//
//  NSColorTransformer.swift
//  RoomApp
//
//  Created by Angelo Essam on 01/12/2021.
//

import Foundation
import AppKit


class NSColorTransformer : ValueTransformer{
    
    // transfer to data
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? NSColor else { return nil }
        do{
            let data = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        }catch{
           return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        do{
            let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: data)
            return color
        }catch{
           return nil
        }
    }
}
