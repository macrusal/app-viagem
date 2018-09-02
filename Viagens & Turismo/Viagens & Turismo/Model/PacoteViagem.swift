//
//  PacoteViagem.swift
//  Viagens & Turismo
//
//  Created by Marcelo on 01/09/2018.
//  Copyright © 2018 Hibejix. All rights reserved.
//

import UIKit

class PacoteViagem: NSObject {
    let nomeHotel:String;
    let descricao:String;
    let dataViagem:String;
    @objc let viagem: Viagem;
    
    init(nomeHotel: String, descricao: String, dataViagem: String, viagem: Viagem) {
        self.nomeHotel = nomeHotel;
        self.descricao = descricao;
        self.dataViagem = dataViagem;
        self.viagem = viagem;
    }
}
