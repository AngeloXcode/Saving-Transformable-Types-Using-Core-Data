//
//  ColorSelectionsView.swift
//  RoomApp
//
//  Created by Angelo Essam on 01/12/2021.
//

import SwiftUI

struct ColorSelectionsView: View {
    let colors : [Color] = [.green,.red,.blue,.pink,.purple,.yellow]
    @Binding var selectedColor : Color
    var body: some View {
        HStack{
            ForEach(colors,id:\.self){ color in
                Image(systemName: selectedColor == color ? "record.circle.fill" : "circle.fill")
                    .font(.title)
                    .foregroundColor(color)
                    .clipShape(Circle())
                    .onTapGesture{
                        selectedColor = color
                    }
                
            }
        }
    }
}

struct ColorSelectionsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectionsView(selectedColor: .constant(.red))
    }
}
