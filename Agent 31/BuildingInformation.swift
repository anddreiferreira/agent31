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
    var qtdJanelas : Int = 0
    var posicaoInicialX = 0
    
    override init() {
    
        super.init()
    
        self.altura = gerarAltura()
        self.largura = gerarLargura()
        self.qtdJanelas = gerarQtdJanelas()
        self.posicaoInicialX = gerarXInicial()
        
    }
    
    func gerarAltura() -> Int{
        
        var novaAltura : Int = 38
        

        return novaAltura
    }
    
    func gerarLargura() -> Int{
        
        var novaLagura : Int = 40
        
        
        
        return novaLagura

        
    }
    
    func gerarQtdJanelas() -> Int{
        
        var novaQuantidade : Int = 2
        
        
        
        return novaQuantidade

    }
    
    func gerarXInicial() -> Int{
    
        var novoX : Int = 50
        
        
        
        return novoX
    
    }

    
    
}
