//
//  ConfirmacaoPagamentoViewController.swift
//  Viagens & Turismo
//
//  Created by Marcelo on 01/09/2018.
//  Copyright © 2018 Hibejix. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!;
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var botaoVoltarHome: UIButton!
    
    var pacoteComprado: PacoteViagem? = nil;

    override func viewDidLoad() {
        super.viewDidLoad();
        if let pacote = pacoteComprado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoImagem);
            self.labelHotelPacoteViagem.text = pacote.nomeHotel;
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo.uppercased();
            self.labelDataPacoteViagem.text = "Válido para o período de: \(pacote.dataViagem)";
            self.labelDescricao.text = pacote.descricao;
            self.imagemPacoteViagem.layer.cornerRadius = 10;
            self.imagemPacoteViagem.layer.masksToBounds = true;
            self.botaoVoltarHome.layer.cornerRadius = 8;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func botaoVoltarHome(_ sender: UIButton) {
        if let navigation = self.navigationController {
            navigation.popToRootViewController(animated: true);
        }
    }
}
