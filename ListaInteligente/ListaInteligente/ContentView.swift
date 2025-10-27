//
//  ContentView.swift
//  ListaInteligente
//
//  Created by Paulo Danilo Conceição Lima on 26/10/25.
//

import SwiftUI

struct ContentView: View {
    var data = ["item 1", "item 2", "item 3", "item 4"]
    
    var body: some View {
        NavigationView {
            List(data, id: \.self) { item in
                Text(item)
            }
            .navigationTitle("Minha Lista")
        }
    }
}

#Preview {
    ContentView()
}
