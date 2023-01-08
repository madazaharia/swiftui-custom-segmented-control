//
//  BackgroundGeometryReader.swift
//  CustomSegmentedControl
//
//  Created by Madalin Zaharia on 08.01.2023.
//

import SwiftUI

struct BackgroundGeometryReader: View {
    
    var body: some View {
        GeometryReader { geometry in
            return Color
                .clear
                .preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
}
