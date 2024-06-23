//
//  CollectionsView.swift
//  SwiftUIStudyProject
//
//  Created by 이보라 on 6/22/24.
//

import SwiftUI

// CollectionsView
struct CollectionsView: View {
    @State private var searchText = ""
    var body: some View {
        VStack {
            collectionHeaderView
            SearchBar(text: $searchText).padding([.leading,.trailing, .bottom], 10)
            CollectionsLazeVGrid()

        }
    }
    
    @ViewBuilder
    private var collectionHeaderView: some View {
        ZStack {
            HStack {
                Text("THE\nART\nMUSEUM")
                    .padding()
                    .fontWeight(StyleConstants.FontWeightBold)
                    .font(StyleConstants.footnoteFont)
                    .foregroundStyle(StyleConstants.ColorBlack)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Collentions")
                    .padding()
                    .fontWeight(StyleConstants.FontWeightBold)
                    .foregroundStyle(StyleConstants.ColorRed)
                Spacer()
            }
        }
    }
}

struct CollectionsItem: Hashable {
    let image: String
    let text: String
}

struct CollectionsLazeVGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let items = [
        CollectionsItem(image: "bgImage", text: "1"),
        CollectionsItem(image: "bgImage", text: "2"),
        CollectionsItem(image: "bgImage", text: "3"),
        CollectionsItem(image: "bgImage", text: "4"),
        CollectionsItem(image: "bgImage", text: "5"),
        CollectionsItem(image: "bgImage", text: "6"),
        CollectionsItem(image: "bgImage", text: "7"),
    ]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        Image(item.image).resizable().frame(width: 160, height: 130)
                        HStack {
                            Text(item.text).foregroundStyle(StyleConstants.ColorRed)
                            Spacer()
                        }.padding(.leading, 20)
                    }
                }
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Explore the Collection", text: $text)
            Image(systemName: "magnifyingglass").foregroundStyle(StyleConstants.ColorRed)
            
        }
        .padding()
        .border(Color.red, width: 3)
        .foregroundColor(.secondary)
        HStack {
            Text("Advanced Search")
                .font(StyleConstants.footnoteFont)
                .foregroundStyle(StyleConstants.ColorRed)
            Spacer()
        }
    }
}
