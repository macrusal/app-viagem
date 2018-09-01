//
//  PacoteViagemDAO.swift
//  Alura Viagens
//
//  Created by Ândriu Coelho on 30/08/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit

class PacoteViagemDAO: NSObject {
    
    func retornaTodasAsViagens() -> Array<PacoteViagem> {
        
        let pacotePortoGalinhas = PacoteViagem(nomeHotel: "Resort Porto de Galinhas", descricao: "Hotel + café da manhã", dataViagem: "8~15 de agosto", viagem: Viagem(titulo: "Porto de Galinhas", quantidadeDias: 7, preco: "2.490,99", caminhoImagem: "img6.jpg"))
        
        let pacoteBuzios = PacoteViagem(nomeHotel: "Resort Buzios Spa", descricao: "Hotel + café da manhã", dataViagem: "9~16 de setembro", viagem: Viagem(titulo: "Buzios", quantidadeDias: 7, preco: "1.990,99", caminhoImagem: "img7.jpg"))
        
        let pacoteNatal = PacoteViagem(nomeHotel: "Resort Natal Show", descricao: "Hotel + café da manhã", dataViagem: "13~18 de setembroo", viagem: Viagem(titulo: "Natal", quantidadeDias: 5, preco: "1.700,00", caminhoImagem: "img8.jpg"))
        
        let pacoteRioDeJaneiro = PacoteViagem(nomeHotel: "Resort RJ Spa", descricao: "Hotel + café da manhã", dataViagem: "9~13 de outubro", viagem: Viagem(titulo: "Rio de Janeiro", quantidadeDias: 4, preco: "2.300,00", caminhoImagem: "img9.jpg"))
        
        let pacoteAmazonas = PacoteViagem(nomeHotel: "Pousada Amazonas Plus", descricao: "Hotel + café da manhã", dataViagem: "9~13 de outubro", viagem: Viagem(titulo: "Amazonas", quantidadeDias: 6, preco: "2.850,00", caminhoImagem: "img10.jpg"))
        
        let pacoteSalvador = PacoteViagem(nomeHotel: "Pousada Salvador", descricao: "Hotel + café da manhã", dataViagem: "5~10 de novembro", viagem: Viagem(titulo: "Salvador", quantidadeDias: 6, preco: "1.880,90", caminhoImagem: "img11.jpg"))
        
        let listaPacotes:Array<PacoteViagem> = [pacotePortoGalinhas, pacoteBuzios, pacoteNatal, pacoteRioDeJaneiro, pacoteAmazonas, pacoteSalvador]
        
        return listaPacotes
    }
}








