//
//  Viagem.swift
//  Viagens & Turismo
//
//  Created by Marcelo on 29/08/2018.
//  Copyright © 2018 Hibejix. All rights reserved.
//

import UIKit

class Viagem: NSObject {

    @objc let titulo: String;
    let quantidadeDias: Int;
    let preco: String;
    let caminhoImagem: String;
    
    init(titulo: String, quantidadeDias: Int, preco: String, caminhoImagem: String) {
        self.titulo = titulo;
        self.quantidadeDias = quantidadeDias;
        self.preco = preco;
        self.caminhoImagem = caminhoImagem;
    }
}
