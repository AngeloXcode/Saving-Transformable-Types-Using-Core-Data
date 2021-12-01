# Saving-Transformable-Types-Using-Core-Data

# thanks azamsharp for great your Tutorial , I do it setp by step .
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
