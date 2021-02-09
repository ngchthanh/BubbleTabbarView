//
//  BubbleTabItemable.swift
//  
//
//  Created by Nguyen Chi Thanh on 09/02/2021.
//

import SwiftUI

public protocol BubbleTabItemable: CaseIterable, Identifiable, Hashable {
    var image: String { get }
    var view: AnyView { get }
    var backgroundColor: Color { get }
    var selectedColor: Color { get }
    var deselectedColor: Color { get }
}
