//
//  ContentView.swift
//  RoomApp
//
//  Created by Angelo Essam on 01/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var name : String = ""
    @State private var color : Color = .clear
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: Room.entity(),
                  sortDescriptors: [], predicate: nil, animation: nil) var allRooms : FetchedResults<Room>
    var body: some View {
        VStack(alignment:.leading){
            Text("Add Room")
                .font(.largeTitle)
            
            TextField("Name",text: $name)
            HStack{
                Text("Color")
                // send color as Property
                ColorSelectionsView(selectedColor: $color)
            }
            Spacer()
            // SaveButton
            Button("Save"){
                let room =  Room(context : viewContext)
                room.name = name
                room.color = NSColor(color)
                try? viewContext.save()

            }
        
            List(allRooms,id:\.self){ room in
                HStack{
                    Text(room.name ?? "")
                    Spacer()
                    Rectangle().fill(Color(room.color ?? .white)).frame(maxWidth:100)
                }
            }
            
        }.padding()
            .frame(maxWidth: 400, maxHeight: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
