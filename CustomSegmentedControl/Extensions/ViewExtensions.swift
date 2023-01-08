//
//  ViewExtensions.swift
//  CustomSegmentedControl
//
//  Created by Madalin Zaharia on 08.01.2023.
//

import SwiftUI

extension View {
    
    public func toAnyView() -> AnyView {
        AnyView(self)
    }
}
