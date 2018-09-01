//
//  DetalhesViagemViewController.swift
//  Viagens & Turismo
//
//  Created by Marcelo on 31/08/2018.
//  Copyright © 2018 Hibejix. All rights reserved.
//

import UIKit

class DetalhesViagemViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!;
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!;
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!;
    @IBOutlet weak var labelDataViagem: UILabel!;
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!;
    @IBOutlet weak var scrollPrincipal: UIScrollView!;
    @IBOutlet weak var textFieldData: UITextField!;
    @IBOutlet weak var botaoFinalizarCompra: UIButton!
    
    var pacoteSelecionado: PacoteViagem? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: .UIKeyboardWillShow, object: nil);
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoImagem);
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo;
            self.labelDescricaoPacoteViagem.text = pacote.descricao;
            self.labelDataViagem.text = pacote.dataViagem;
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco;
            self.botaoFinalizarCompra.layer.cornerRadius = 8;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    @objc func aumentarScroll(notification: Notification) {
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320);
    }

    @objc func exibeDataTextField(_ sender: UIDatePicker) {
        let formatador = DateFormatter();
        formatador.dateFormat = "dd/MM/yyyy";
        self.textFieldData.text = formatador.string(from: sender.date);
    }
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func textFieldDataFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker();
        datePickerView.datePickerMode = .date;
        sender.inputView = datePickerView;
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(_:)), for: .valueChanged)
    }
    
    @IBAction func botaoFinalizarCompra(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil);
        let controller = storyBoard.instantiateViewController(withIdentifier:"confirmacaoPagamento") as! ConfirmacaoPagamentoViewController;
        controller.pacoteComprado = pacoteSelecionado;
        self.navigationController?.pushViewController(controller, animated: true);
    }
    
}
