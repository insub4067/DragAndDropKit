# DragAndDropKit
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Static Badge](https://img.shields.io/badge/iOS-v14-blue)
![Static Badge](https://img.shields.io/badge/Swift-5.4-orange)

## What is DragAndDropKit?
> DragAndDropKit allows you to implement drag and drop functionality easily in your SwiftUI projects without any effort.

## ✔️ Result 
<img src="https://github.com/insub4067/DragAndDropKit/assets/85481204/fa0b1cec-6294-47f1-bff2-94c1a953fb07" width="300">

## ✔️ Example Code
```swift
import SwiftUI
import DragAndDropKit

struct DragAndDropPractice: View {
    
    @State var items: [Item] = Array(1...20).map { Item(id: $0) }
    @State var currentDragging: Item? = nil
    
    var body: some View {
        ScrollView {
            LazyVStack(content: {
                ForEach(items, id: \.self) { item in
                    Text("Placeholder \(item.id)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color.gray.opacity(0.6))
                        .dragAndDrop(
                            item: item,
                            items: $items,
                            currentDragging: $currentDragging)
                }
            })
        }
    }
}

struct Item: Identifiable, Hashable {
    let id: Int
}
```
