//
//  CustomSegmentedControl.swift
//  CustomSegmentedControl
//
//  Created by Madalin Zaharia on 08.01.2023.
//

import SwiftUI

struct CustomSegmentedControl: View {
    // MARK: - Properties
    private let activeSegmentColor: Color = Color.white
    private let backgroundColor: Color = Color.blue.opacity(0.4)
    private let shadowColor: Color = Color.gray
    private let textColor: Color = Color.black.opacity(0.6)
    private let selectedTextColor: Color = Color.black
    
    private static let selectedUITextFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .bold)
    private let selectedTextFont: Font = Font.headline
    
    private let textFont: Font = Font.body
    
    private let segmentCornerRadius: CGFloat = 24
    private let shadowRadius: CGFloat = 4
    private let segmentXPadding: CGFloat = 16
    private let segmentYPadding: CGFloat = 8
    private let pickerPadding: CGFloat = 4
    
    private static let animationDuration: Double = 0.2
    
    // Stores the size of a segment, used to create the active segment rect
    @State private var segmentSize: CGSize = .zero
    // Rounded rectangle to denote active segment
    
    private var activeSegmentView: AnyView {
        // Don't show the active segment until we have initialized the view
        // This is required for `.animation()` to display properly, otherwise the animation will fire on init
        let isInitialized: Bool = segmentSize != .zero
        if !isInitialized {
            return EmptyView().toAnyView()
        }
        
        return RoundedRectangle(cornerRadius: segmentCornerRadius)
            .foregroundColor(activeSegmentColor)
            .shadow(color: shadowColor, radius: shadowRadius)
            .frame(width: segmentSize.width, height: segmentSize.height)
            .offset(x: computeActiveSegmentHorizontalOffset(), y: 0)
            .animation(Animation.linear(duration: CustomSegmentedControl.animationDuration))
            .toAnyView()
    }
    
    @Binding private var selection: Int
    private let items: [String]
    
    // MARK: - Init
    init(items: [String], selection: Binding<Int>) {
        self._selection = selection
        self.items = items
    }
    
    // MARK: - Drawing
    var body: some View {
        // Align the ZStack to the leading edge to make calculating offset on activeSegmentView easier
        ZStack(alignment: .leading) {
            self.activeSegmentView // activeSegmentView indicates the current selection
            
            HStack {
                ForEach(0..<self.items.count, id: \.self) { index in
                    self.getSegmentView(for: index)
                }
            }
        }
        .padding(pickerPadding)
        .background(backgroundColor)
        .clipShape(Capsule())
    }
    
    // Helper method to compute the offset based on the selected index
    private func computeActiveSegmentHorizontalOffset() -> CGFloat {
        CGFloat(self.selection) * (self.segmentSize.width + segmentXPadding / 2)
    }
    
    // Gets text view for the segment
    private func getSegmentView(for index: Int) -> some View {
        guard index < items.count else {
            return EmptyView().toAnyView()
        }
        
        let isSelected = self.selection == index
        
        return Text(items[index])
            .font(isSelected ? selectedTextFont : textFont)
            .foregroundColor(isSelected ? selectedTextColor: textColor)
            .lineLimit(1)
            .padding(.vertical, segmentYPadding)
            .padding(.horizontal, segmentXPadding)
            .frame(minWidth: 0, maxWidth: .infinity)
            .modifier(SizeAwareViewModifier(viewSize: self.$segmentSize)) // Watch for the size of the
            .onTapGesture {
                self.onItemTap(index: index)
            }
            .toAnyView()
    }
    
    // On tap to change the selection
    private func onItemTap(index: Int) {
        guard index < self.items.count else {
            return
        }
        self.selection = index
    }
}
