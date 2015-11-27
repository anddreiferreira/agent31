//
//  BuildingInformation.swift
//  Agent 31
//
//  Created by Henrique Dutra on 26/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class BuildingInformation: NSObject {

    var largura : Int = 0
    var altura : Int = 0
    var qtdAndares : Int = 0
    var qtdJanelas : Int = 0
    var posicaoInicialX = 0
    
    override init() {
    
        super.init()
    
        self.qtdAndares = gerarAndares()
        self.altura = gerarAltura()
        self.largura = gerarLargura()
        self.qtdJanelas = gerarQtdJanelas()
        self.posicaoInicialX = gerarXInicial()
        
    }
    
    func gerarAndares () -> Int {
    
        let novaQtdAndares : Int = Int(arc4random_uniform(4)) + 2

        return novaQtdAndares
    }
    
    func gerarAltura() -> Int{
        
        // andar completo + base + topo
        let novaAltura : Int = ((self.qtdAndares * 8) + 6) + 4
        print(novaAltura)
        print(qtdAndares)
        
        return novaAltura
    }
    
    func gerarLargura() -> Int{
        
        let operador : Int =  Int(arc4random_uniform(3)) + 1
        let novaLagura : Int = operador * 20
        
        return novaLagura
    }
    
    func gerarQtdJanelas() -> Int{
        
        let novaQuantidade : Int = Int(arc4random_uniform(3)) + 1
        
        return novaQuantidade

    }
    
    func gerarXInicial() -> Int{
    
        let novoX : Int = Int(arc4random_uniform(800)) + 20
        
        return novoX
    
    }

    
    
}
