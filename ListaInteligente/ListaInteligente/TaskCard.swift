//
//  TaskCard.swift
//  ListaInteligente
//
//  Created by Paulo Danilo Conceição Lima on 26/10/25.
//

import Foundation
import SwiftUI

struct TaskCard: View {
    var item: ItensModel
    var onToggle: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(item.discription)
                    .font(.headline)
                Text(item.criationDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Toggle("", isOn: Binding(
                get: { item.status == .complete },
                set: { _ in onToggle() }
            ))
            .labelsHidden()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(item.status == .complete ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
        )
    }
}
