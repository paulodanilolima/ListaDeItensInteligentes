//
//  ItensModel.swift
//  ListaInteligente
//
//  Created by Paulo Danilo Conceição Lima on 26/10/25.
//

import Foundation

struct ItensModel: Identifiable {
    let id = UUID()
    var discription: String
    var criationDate: String
    var status: itemStatus
}

enum itemStatus {
    case incomplete
    case complete
}
