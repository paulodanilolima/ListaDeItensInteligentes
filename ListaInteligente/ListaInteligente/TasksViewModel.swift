//
//  TasksViewModel.swift
//  ListaInteligente
//
//  Created by Paulo Danilo Conceição Lima on 26/10/25.
//

import Foundation
import SwiftUI

@MainActor
final class TasksViewModel: ObservableObject {
    @Published var incompleteItems: [ItensModel]
    @Published var completeItems: [ItensModel]
    @Published var showingAddSheet = false
    
    private let formatter: DateFormatter
    
    init() {
        self.formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        self.incompleteItems = [
            .init(discription: "Jogar Lixo Fora", criationDate: "26/10/2025", status: .incomplete),
            .init(discription: "Lavar o carro", criationDate: "24/10/2025", status: .incomplete),
            .init(discription: "Fazer dever de casa", criationDate: "20/10/2025", status: .incomplete),
            .init(discription: "Comprar pão", criationDate: "27/10/2025", status: .incomplete),
            .init(discription: "Ligar para o banco", criationDate: "25/10/2025", status: .incomplete)
        ]
        
        self.completeItems = [
            .init(discription: "Fazer Compras", criationDate: "22/10/2025", status: .complete),
            .init(discription: "Levar o cachorro ao veterinário", criationDate: "21/10/2025", status: .complete)
        ]
    }
    
    // Adicionar novo item
    func addItem(description: String) {
        let newItem = ItensModel(
            discription: description,
            criationDate: formatter.string(from: Date()),
            status: .incomplete
        )
        incompleteItems.append(newItem)
    }
    
    // Alternar status entre incompleto e completo
    func toggleStatus(_ item: ItensModel) {
        withAnimation(.easeInOut) {
            if item.status == .incomplete {
                if let index = incompleteItems.firstIndex(where: { $0.id == item.id }) {
                    var updated = incompleteItems.remove(at: index)
                    updated.status = .complete
                    completeItems.append(updated)
                }
            } else {
                if let index = completeItems.firstIndex(where: { $0.id == item.id }) {
                    var updated = completeItems.remove(at: index)
                    updated.status = .incomplete
                    incompleteItems.append(updated)
                }
            }
        }
    }
    
    // Deletar itens via swipe
    func deleteIncomplete(at offsets: IndexSet) {
        withAnimation {
            incompleteItems.remove(atOffsets: offsets)
        }
    }
    
    func deleteComplete(at offsets: IndexSet) {
        withAnimation {
            completeItems.remove(atOffsets: offsets)
        }
    }
    
    // Ordenar por data (mais recente primeiro)
    func sortedItems(_ items: [ItensModel]) -> [ItensModel] {
        items.sorted {
            guard let date1 = formatter.date(from: $0.criationDate),
                  let date2 = formatter.date(from: $1.criationDate)
            else { return false }
            return date1 > date2
        }
    }
}
