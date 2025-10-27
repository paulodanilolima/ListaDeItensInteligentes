//
//  AddItemSheet.swift
//  ListaInteligente
//
//  Created by Paulo Danilo Conceição Lima on 26/10/25.
//

import Foundation
import SwiftUI

struct AddItemSheet: View {
    @Binding var isPresented: Bool
    var onAdd: (String) -> Void
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Digite a descrição...", text: $description)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(action: {
                    if !description.trimmingCharacters(in: .whitespaces).isEmpty {
                        onAdd(description)
                        isPresented = false
                    }
                }) {
                    Text("Salvar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding(.top, 40)
            .navigationTitle("Nova Tarefa")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { isPresented = false }
                }
            }
        }
    }
}
