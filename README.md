# Saving Transformable Types Using Core Data
## Transformable : 
 Core Data allows us to store integers, booleans, strings, UUID, date, etc. but sometimes we want to store a specific data type like UIColor, UIImage, our own class, struct, or enum, and even arrays, but that is simply not an option in Attribute’s Type.Transformable property type which allows us to store custom data types as an object of the declared attribute for a record of an Entity. The only requirement is that our custom type should conform to NSCoding or we need to provide a custom value transformer.
### thanks azamsharp for great your Tutorial , I do it setp by step .
https://www.youtube.com/watch?v=g6jBU8E1K2U

## Sample Code 
### Fetch all data from Core Data by SwiftUI  
@FetchRequest(entity: Room.entity(),sortDescriptors: [], predicate: nil, animation: nil) var allRooms : FetchedResults<Room>

### Way to transform between NSColor to Data 
 guard let color = value as? NSColor else { return nil }
        do{
            let data = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        }catch{
           return nil
        }
        
        
  ### Way to transform from Data to NSColor
 guard let data = value as? Data else { return nil }
        do{
            let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: data)
            return color
        }catch{
           return nil
        }
