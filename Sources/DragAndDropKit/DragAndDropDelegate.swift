//
//  DragAndDropDelegate.swift
//  
//
//  Created by 김인섭 on 3/12/24.
//

import SwiftUI

struct DragAndDropDelegate<Item: Equatable>: DropDelegate where Item: Identifiable {
    
    let item: Item
    @Binding var items: [Item]
    @Binding var current: Item?
    let onRelocate: (() -> Void)?
    
    public init(
        item: Item,
        items: Binding<[Item]>,
        current: Binding<Item?> = .constant(nil),
        onRelocate: (() -> Void)?)
    {
        self.item = item
        self._items = items
        self._current = current
        self.onRelocate = onRelocate
    }

    public func dropEntered(info: DropInfo) {
        guard item != current else { return }
        DispatchQueue.main.async {
            withAnimation {
                let from = items.firstIndex(of: current!)!
                let to = items.firstIndex(of: item)!
                if items[to].id != current!.id {
                    items.move(
                        fromOffsets: IndexSet(integer: from),
                        toOffset: to > from ? to + 1 : to
                    )
                }
            }
            self.onRelocate?()
        }
    }

    public func dropUpdated(info: DropInfo) -> DropProposal? {
        DropProposal(operation: .move)
    }

    public func performDrop(info: DropInfo) -> Bool {
        self.current = nil
        return true
    }
}
