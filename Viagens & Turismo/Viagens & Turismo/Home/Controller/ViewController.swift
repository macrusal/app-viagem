//
//  ViewController.swift
//  Viagens & Turismo
//
//  Created by Marcelo on 29/08/2018.
//  Copyright © 2018 Hibejix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let listaViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens();
    
    @IBOutlet weak var tabelaViagens: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self;
        self.viewPacotes.layer.cornerRadius = 10;
        self.viewHoteis.layer.cornerRadius = 10;
        self.tabelaViagens.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! TableViewCell;
        let viagemAtual = listaViagens[indexPath.row];
        cell.labelTitulo?.text = viagemAtual.titulo;
        cell.labelQuantidadeDias?.text = "\(viagemAtual.quantidadeDias) dias";
        cell.labelPreco?.text = viagemAtual.preco;
        cell.imagemViagem?.image = UIImage(named: viagemAtual.caminhoImagem);
        cell.imagemViagem.layer.cornerRadius = 10;
        cell.imagemViagem.layer.masksToBounds = true;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175;
    }
}

