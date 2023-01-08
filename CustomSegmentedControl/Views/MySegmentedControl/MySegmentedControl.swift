//
//  MySegmentedControl.swift
//  CustomSegmentedControl
//
//  Created by Madalin Zaharia on 08.01.2023.
//

import SwiftUI

public struct MySegmentedControl: View {
    // MARK: - Properties
    var items: [String]

    @Binding var selection: Int

    public init(items: [String], selection: Binding<Int>) {
        self.items = items
        _selection = selection
    }

    // MARK: - Drawing
    public var body: some View {
        CustomSegmentedControl(items: self.items, selection: self.$selection)
    }
}

struct MySegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        MySegmentedControl(items: ["All", "Favorites"], selection: Binding<Int>.constant(0))
    }
}
