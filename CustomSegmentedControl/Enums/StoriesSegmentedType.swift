//
//  StoriesSegmentedType.swift
//  CustomSegmentedControl
//
//  Created by Madalin Zaharia on 08.01.2023.
//

import Foundation

enum StoriesSegmentedType: Int, CaseIterable {
    case all = 0
    case favorites = 1
    
    var name: String {
        switch self {
        case .all: return "All"
        case .favorites: return "Favorites"
        }
    }
}
