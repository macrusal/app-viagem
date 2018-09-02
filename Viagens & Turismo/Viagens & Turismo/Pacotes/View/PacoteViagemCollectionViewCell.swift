//
//  PacoteViagemCollectionViewCell.swift
//  Viagens & Turismo
//
//  Created by Marcelo on 31/08/2018.
//  Copyright © 2018 Hibejix. All rights reserved.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!;
    @IBOutlet weak var labelQuantidadeDias: UILabel!;
    @IBOutlet weak var labelPreco: UILabel!;
    
    func configuraCelula(pacoteViagem: PacoteViagem) {
        labelTitulo?.text = pacoteViagem.viagem.titulo;
        labelQuantidadeDias?.text = "\(pacoteViagem.viagem.quantidadeDias) dias";
        labelPreco?.text = "R$ \(pacoteViagem.viagem.preco)";
        imagemViagem?.image = UIImage(named: pacoteViagem.viagem.caminhoImagem);
        layer.borderWidth = 0.5;
        layer.borderColor = UIColor(displayP3Red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor;
        layer.cornerRadius = 8;
    }
    
    
}
