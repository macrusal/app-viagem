//
//  PacotesViagensViewController.swift
//  Viagens & Turismo
//
//  Created by Marcelo on 31/08/2018.
//  Copyright © 2018 Hibejix. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    let listaComTodasViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens();
    var listaViagens:Array<Viagem> = [];
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!;
    @IBOutlet weak var pesquisarViagens: UISearchBar!;
    
    @IBOutlet weak var labelContadorPacotes: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad();
        listaViagens = listaComTodasViagens;
        self.labelContadorPacotes.text = self.atualizaContadorLabel();
        colecaoPacotesViagem.dataSource = self;
        colecaoPacotesViagem.delegate = self;
        pesquisarViagens.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell;
        
        let viagemAtual = listaViagens[indexPath.item];
        
        celulaPacote.labelTitulo?.text = viagemAtual.titulo;
        celulaPacote.labelQuantidadeDias?.text = "\(viagemAtual.quantidadeDias) dias";
        celulaPacote.labelPreco?.text = "R$ \(viagemAtual.preco)";
        celulaPacote.imagemViagem?.image = UIImage(named: viagemAtual.caminhoImagem);
        celulaPacote.layer.borderWidth = 0.5;
        celulaPacote.layer.borderColor = UIColor(displayP3Red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor;
        celulaPacote.layer.cornerRadius = 8;
        return celulaPacote;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let larguraCelula = colecaoPacotesViagem.bounds.width-15;
        return CGSize(width: larguraCelula / 2, height: 160);
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens;
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "titulo contains%@", searchText);
            let listaFiltrada:Array<Viagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array;
            listaViagens = listaFiltrada;
        }
        self.labelContadorPacotes.text = self.atualizaContadorLabel();
        colecaoPacotesViagem.reloadData();
    }
    
    func atualizaContadorLabel() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados";
    }
}
