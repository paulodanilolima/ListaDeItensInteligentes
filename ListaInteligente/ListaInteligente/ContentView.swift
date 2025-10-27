//
//  ContentView.swift
//  ListaInteligente
//
//  Created by Paulo Danilo Conceição Lima on 26/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TasksViewModel()
    
    var body: some View {
        NavigationView {
            List {
                // Seção Incompletas
                if !viewModel.incompleteItems.isEmpty {
                    Section(header: Text("Incompletas").font(.title3.bold())) {
                        ForEach(viewModel.sortedItems(viewModel.incompleteItems)) { item in
                            TaskCard(item: item) {
                                viewModel.toggleStatus(item)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: viewModel.deleteIncomplete)
                    }
                }
                
                // Seção Completas
                if !viewModel.completeItems.isEmpty {
                    Section(header: Text("Completas").font(.title3.bold())) {
                        ForEach(viewModel.sortedItems(viewModel.completeItems)) { item in
                            TaskCard(item: item) {
                                viewModel.toggleStatus(item)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden) 
                            .opacity(0.6)
                        }
                        .onDelete(perform: viewModel.deleteComplete)
                    }
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationTitle("Minhas Tarefas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingAddSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingAddSheet) {
                AddItemSheet(isPresented: $viewModel.showingAddSheet) { description in
                    viewModel.addItem(description: description)
                }
            }
        }
    }
}
