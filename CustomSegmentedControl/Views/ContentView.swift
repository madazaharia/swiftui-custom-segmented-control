//
//  ContentView.swift
//  CustomSegmentedControl
//
//  Created by Madalin Zaharia on 08.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var segmentedTypeSelection: Int = StoriesSegmentedType.all.rawValue
    
    // MARK: - Drawing
    var body: some View {
        VStack {
            segmentedControl
            Spacer()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var segmentedControl: some View {
        MySegmentedControl(
            items: [
                StoriesSegmentedType.all.name,
                StoriesSegmentedType.favorites.name
            ],
            selection: $segmentedTypeSelection
        )
        .padding(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
