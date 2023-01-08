//
//  SizePreferenceKey.swift
//  CustomSegmentedControl
//
//  Created by Madalin Zaharia on 08.01.2023.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
        
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
