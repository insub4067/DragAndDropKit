//
//  View+.swift
//
//
//  Created by 김인섭 on 3/12/24.
//

import SwiftUI
import UniformTypeIdentifiers

public extension View {
    
    @ViewBuilder func dragAndDrop<Item: Equatable & Identifiable> (
        _ isDraggable: Bool = true,
        item: Item,
        items: Binding<[Item]>,
        currentDragging: Binding<Item?>,
        onRelocate: (() -> Void)? = .none
    ) -> some View {
        if isDraggable {
            self
                .onDrag({
                    currentDragging.wrappedValue = item
                    return NSItemProvider(object: "\(item.id)" as NSString)
                })
                .onDrop(
                    of: [UTType.text],
                    delegate: DragAndDropDelegate(
                        item: item,
                        items: items,
                        current: currentDragging,
                        onRelocate: onRelocate
                    )
                )
        } else {
            self
        }
    }
}

