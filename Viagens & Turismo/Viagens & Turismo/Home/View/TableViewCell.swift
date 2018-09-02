//
//  TableViewCell.swift
//  Viagens & Turismo
//
//  Created by Marcelo on 29/08/2018.
//  Copyright © 2018 Hibejix. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!
    
    func configuraCelula(viagem: Viagem) {
        labelTitulo?.text = viagem.titulo;
        labelQuantidadeDias?.text = viagem.quantidadeDias == 1 ? "1 dia" : "\(viagem.quantidadeDias) dias";
        labelPreco?.text = "R$ \(viagem.preco)";
        imagemViagem?.image = UIImage(named: viagem.caminhoImagem);
        imagemViagem.layer.cornerRadius = 10;
        imagemViagem.layer.masksToBounds = true;
    }
}
