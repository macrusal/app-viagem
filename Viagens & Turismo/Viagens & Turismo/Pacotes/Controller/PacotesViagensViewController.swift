//
//  PacotesViagensViewController.swift
//  Viagens & Turismo
//
//  Created by Marcelo on 31/08/2018.
//  Copyright © 2018 Hibejix. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate {

    let listaComTodasViagens:Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens();
    var listaViagens:Array<PacoteViagem> = [];
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
        let pacoteAtual = listaViagens[indexPath.item];
        celulaPacote.configuraCelula(pacoteViagem: pacoteAtual);
        return celulaPacote;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: colecaoPacotesViagem.bounds.width/2-20, height: 160) : CGSize(width: colecaoPacotesViagem.bounds.width/3-20, height: 250);
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item];
        let storyBoard = UIStoryboard(name: "Main", bundle: nil);
        let controller = storyBoard.instantiateViewController(withIdentifier: "detalhesViagem") as! DetalhesViagemViewController;
        controller.pacoteSelecionado = pacote;
        self.navigationController?.pushViewController(controller, animated: true);
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens;
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "viagem.titulo contains%@", searchText);
            let listaFiltrada:Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array;
            listaViagens = listaFiltrada;
        }
        self.labelContadorPacotes.text = self.atualizaContadorLabel();
        colecaoPacotesViagem.reloadData();
    }
    
    func atualizaContadorLabel() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados";
    }
    
}
