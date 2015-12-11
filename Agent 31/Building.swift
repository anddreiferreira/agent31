import SpriteKit

enum Tile: Int {
    
    case Tijolo
    case Base
    case BaseEsquerda
    case BaseDireita
    case BaseAndarBaixo
    case BaseAndarCima
    case TetoDireita
    case TetoEsquerda
    case TetoChao
    case TetoBase
    case LateralChao
    case LateralBase
    case Parapeito
    case VarandaCima
    case VarandaBaixo
    case VarandaCimaEsquerda
    case VarandaCimaDireita
    case VarandaBaixoEsquerda
    case VarandaBaixoDireita
    case PilastraCorpo
    case PilastraTopo
    case PilastraBase
    
    var description:String {
        switch self {
        case Tijolo :
            return "Tijolo"
        case Base :
            return "baseNormal"
        case BaseEsquerda :
            return "baseEsquerda"
        case BaseDireita :
            return "baseDireita"
        case TetoChao :
            return "tetoChao"
        case TetoDireita :
            return "tetoDireita"
        case TetoEsquerda :
            return "tetoEsquerda"
        case TetoBase :
            return "tetoBase"
        case LateralChao :
            return "lateralChao"
        case LateralBase :
            return "lateralBase"
        case Parapeito :
            return "parapeito"
        case VarandaCima :
            return "varandaCima"
        case VarandaBaixo :
            return "varandaBaixo"
        case VarandaCimaEsquerda :
            return "varandaCimaEsquerda"
        case VarandaCimaDireita :
            return "varandaCimaDireita"
        case VarandaBaixoEsquerda :
            return "varandaBaixoEsquerda"
        case VarandaBaixoDireita :
            return "varandaBaixoDireita"
        case PilastraCorpo :
            return "pilastraCorpo"
        case PilastraBase :
            return "pilastraBase"
        case PilastraTopo :
            return "pilastraTopo"
        default :
            return "Nada"
            
        }
    }
    
    
    var image:String {
        switch self {
        case Tijolo :
            return "tijolo"
        case Base :
            return "baseNormal"
        case BaseEsquerda :
            return "baseEsquerda"
        case BaseDireita :
            return "baseDireita"
        case TetoChao :
            return "tetoChao"
        case TetoDireita :
            return "tetoDireita"
        case TetoEsquerda :
            return "tetoEsquerda"
        case TetoBase :
            return "tetoBase"
        case LateralChao :
            return "lateralChao"
        case LateralBase :
            return "baseLateral"
        case Parapeito :
            return "parapeito"
        case VarandaCima :
            return "varandaCima"
        case VarandaBaixo :
            return "varandaBaixo"
        case VarandaCimaEsquerda :
            return "varandaCimaEsquerda"
        case VarandaCimaDireita :
            return "varandaCimaDireita"
        case VarandaBaixoEsquerda :
            return "varandaBaixoEsquerda"
        case VarandaBaixoDireita :
            return "varandaBaixoDireita"
        case PilastraCorpo :
            return "pilastraCorpo"
        case PilastraBase :
            return "pilastraBase"
        case PilastraTopo :
            return "pilastraTopo"
        default :
            return ""
        }
    }
    
}

class Building: SKNode {
    
    let buildingView:SKSpriteNode

    let tileSize = (width:20, height:20)
    
    var larguraPredio : Int
    var alturaPredio : Int
    
    var startingPosition : CGPoint
    
    var qtdJanelas : Int = 0
    var qtdAndares : Int = 0
    var qtdPilastras : Int = 0
    
    init(largura: Int = 40, altura : Int = 34, andares : Int = 3, pilastras : Int = 2, posicalIncialX : Int = 0) {
        
        let  posicaoInicial : CGPoint = CGPointMake(CGFloat(posicalIncialX), 30)
        
        startingPosition = posicaoInicial
        
        larguraPredio = largura
        alturaPredio = altura
        qtdAndares = andares
        qtdPilastras = pilastras
        
        buildingView = SKSpriteNode()
        
        super.init()
        
        self.addChild(buildingView)
        
        self.colocarTodosOsTijolos()
        self.colocarBase()
        self.colocarAndares()
        self.colocarLateral()
        self.colocarTopo()
        self.colocarPilastras()
        self.colocarJanelas()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func colocarLateral(){
    
        let lateralChao = Tile(rawValue: 10)!
        let lateralBase = Tile(rawValue: 11)!
        let parapeito = Tile(rawValue: 12)!

        var ponto = CGPoint(x: Int(self.startingPosition.x - 40), y: Int(self.startingPosition.y) + 20)
        colocarUmaTile(lateralChao.image, posicao: ponto, zCoordenada: 21)
    
        var auxiliar = 60
        let xCoordenada = self.startingPosition.x - 20
        var yCoordenada = self.startingPosition.y + 40
        
        while(auxiliar < alturaPredio * 20){
            
            yCoordenada += 20
            
            ponto = CGPoint(x: xCoordenada, y: yCoordenada)
            colocarUmaTile(lateralBase.image, posicao: ponto, zCoordenada: 19)
            
            auxiliar += 20
        }
        
        ponto = CGPoint(x: Int(self.startingPosition.x - 20), y: Int(self.startingPosition.y) + 80)
        colocarUmaTile(parapeito.image, posicao: ponto, zCoordenada: 22)
    }
    
    func colocarParapeitoAndar(altura : Int){
    
        let parapeito = Tile(rawValue: 12)!
        let ponto = CGPoint(x: Int(self.startingPosition.x - 20), y: altura+20)
        
        colocarUmaTile(parapeito.image, posicao: ponto, zCoordenada: 22)

    }
    
    func colocarBase(){
        
        var xCoordenada = self.startingPosition.x + 20
        let yCoordenada = self.startingPosition.y + 20
        
        var ponto = CGPoint(x: xCoordenada, y: yCoordenada)
        
        let base = Tile(rawValue: 1)!
        let baseEsquerda = Tile(rawValue: 2)!
        let baseDireita = Tile(rawValue: 3)!

        
        // colocar base da esquerda
        colocarUmaTile(baseEsquerda.image, posicao: ponto, zCoordenada: 21)
        
        // auxiliar para percorrer lateralmente
        var auxiliar = 40
        
        while(auxiliar < (larguraPredio * 20) - 40){
        
            xCoordenada += 40
            
            ponto = CGPoint(x: xCoordenada, y: yCoordenada)
            
            // colocar base central
            colocarUmaTile(base.image, posicao: ponto, zCoordenada: 21)
            
            auxiliar += 40
        }
        
        xCoordenada += 40

        ponto = CGPoint(x: xCoordenada, y: yCoordenada)
        
        // colocar base da direita
        colocarUmaTile(baseDireita.image, posicao: ponto, zCoordenada: 21)
        
       colocarBaseChao()
    }
    
    func colocarBaseChao(){
    
        let varandaCima = Tile(rawValue: 13)!
        let varandaCimaEquerda = Tile(rawValue: 15)!
        let varandaCimaDireita = Tile(rawValue: 16)!
        
        var auxiliar = 0 // serve para navegar pela estrutura de repeticao e parar quando necesario
        var xCoordenada = self.startingPosition.x + 20
        let yCoordenada = self.startingPosition.y + 90
        var ponto = CGPointZero
        
        while(auxiliar < (larguraPredio * 20) - 80){
    
                xCoordenada += 40
    
                ponto = CGPoint(x: xCoordenada, y: yCoordenada)
                colocarUmaTile(varandaCima.image, posicao: ponto, zCoordenada: 22)
    
                auxiliar += 40
        }
    
        xCoordenada += 40
    
        // varanda direita
        ponto = CGPoint(x: xCoordenada, y: yCoordenada)
        colocarUmaTile(varandaCimaDireita.image, posicao: ponto, zCoordenada: 23)
    
        // varanda esquerda
        ponto = CGPoint(x: self.startingPosition.x + 20, y: self.startingPosition.y + 90)
        colocarUmaTile(varandaCimaEquerda.image, posicao: ponto, zCoordenada: 22)

    
    }
    
    func colocarAndares(){
        
        var altura : Int = 40
        
        for _ in 0..<qtdAndares {
            
            altura += 160
            colocarAndarSingular(altura)
            
        }
    }
    
    func colocarAndarSingular(altura : Int){
    
        let varandaCima = Tile(rawValue: 13)!
        let varandaBaixo = Tile(rawValue: 14)!
        let varandaEsquerdaCima = Tile(rawValue: 15)!
        let varandaDireitaCima = Tile(rawValue: 16)!
        let varandaEsquerdaBaixo = Tile(rawValue: 17)!
        let varandaDireitaBaixo = Tile(rawValue: 18)!

        var ponto = CGPointZero
        var pontoCima = CGPointZero
        
        var auxiliar = 0
        var xCoordenada = Int(self.startingPosition.x + 20)
        let yCoordenada = altura
        
        while(auxiliar < (larguraPredio * 20) - 80){
            
            xCoordenada += 40
            
            ponto = CGPoint(x: xCoordenada, y: yCoordenada)
            pontoCima = CGPoint(x: xCoordenada, y: yCoordenada + 40)
            
            colocarUmaTile(varandaBaixo.image, posicao: ponto, zCoordenada: 21)
            colocarUmaTile(varandaCima.image, posicao: pontoCima, zCoordenada: 21)
            
            auxiliar += 40
        }
        
        xCoordenada += 40
        
        // varanda direita
        ponto = CGPoint(x: xCoordenada, y: yCoordenada+40)
        colocarUmaTile(varandaDireitaCima.image, posicao: ponto, zCoordenada: 24)
        
        ponto = CGPoint(x: xCoordenada, y: yCoordenada)
        colocarUmaTile(varandaDireitaBaixo.image, posicao: ponto, zCoordenada: 24)
        
        // varanda esquerda
        ponto = CGPoint(x: Int(self.startingPosition.x + 20), y: yCoordenada + 40)
        colocarUmaTile(varandaEsquerdaCima.image, posicao: ponto, zCoordenada: 24)
        
        ponto = CGPoint(x: Int(self.startingPosition.x + 20), y: yCoordenada)
        colocarUmaTile(varandaEsquerdaBaixo.image, posicao: ponto, zCoordenada: 24)
        
        colocarParapeitoAndar(altura)
    }
    
    func colocarTopo(){
        
        let tetoDireita = Tile(rawValue: 6)!
        let tetoEsquerda = Tile(rawValue: 7)!
        let chao = Tile(rawValue: 8)!
//        let tetoBase = Tile(rawValue: 9)!
        
        let stringChaoTeto : String = "baseTeto"
        
        var opcao : Int
        
        var ponto = CGPoint(x: Int(self.startingPosition.x - 30), y: (self.alturaPredio * tileSize.width) + 0)
        colocarUmaTile(tetoEsquerda.image, posicao: ponto)

        ponto = CGPoint(x: (  Int(self.startingPosition.x) + self.larguraPredio * tileSize.width) - 60, y: (self.alturaPredio * tileSize.width) + 20)
        colocarUmaTile(tetoDireita.image, posicao: ponto)
        
        var auxiliar = 0
        var xCoordenada = Int(self.startingPosition.x)
        var yCoordenada = (self.alturaPredio + 1) * 20
        
        while(auxiliar < (larguraPredio * 20) - 80){
            
            xCoordenada += 20
            
            ponto = CGPoint(x: xCoordenada, y: yCoordenada)
            colocarUmaTile(chao.image, posicao: ponto, zCoordenada: 21)
    
            auxiliar += 20
        }
        
        auxiliar = 0
        xCoordenada = Int(self.startingPosition.x)
        yCoordenada = (self.alturaPredio + 1) * 20
        
        while(auxiliar < (larguraPredio - 1) * 20){
            
            xCoordenada += 20
     
            opcao = Int(arc4random_uniform(9)) + 1
            let tetoOpcao = stringChaoTeto + String(opcao)
            
            ponto = CGPoint(x: xCoordenada, y: yCoordenada - 20)
            colocarUmaTile(tetoOpcao, posicao: ponto, zCoordenada: 21)
            
            auxiliar += 20
        }

        
    
    }
    
    func colocarTodosOsTijolos(){
    
        var xStart : Int
        var yStart : Int
        var ponto : CGPoint = CGPointZero
        var opcao : Int = 1
        let stringTijolo = "tijolo"
        var larguraAux = self.larguraPredio - 2
        var alturaAux = 0
        
        
        while(alturaAux < self.alturaPredio){
            while(larguraAux >= 0){

                xStart = larguraAux + 1
                yStart = alturaAux + 1
                
                ponto = CGPoint(x: Int(self.startingPosition.x) + (xStart * tileSize.width), y: (yStart * tileSize.height))
                opcao = Int(arc4random_uniform(7)) + 1
                
                let tijoloOpcao = stringTijolo + String(opcao)
                
                colocarUmaTile(tijoloOpcao, posicao: ponto)

                
                larguraAux--
            }
            alturaAux++
            larguraAux = self.larguraPredio - 2

        }
        
//        for i in 0..<self.alturaPredio {
//            for j in 0..<self.larguraPredio - 1{
//                
//                xStart = j + 1
//                yStart = i + 1
//                
//                ponto = CGPoint(x: (xStart * tileSize.width), y: (yStart * tileSize.height))
//                opcao = Int(arc4random_uniform(7)) + 1
//            
//                let tijoloOpcao = stringTijolo + String(opcao)
//                
//                colocarUmaTile(tijoloOpcao, posicao: ponto)
//                
//            }
//            
//        }
    
    }
    
    
    func colocarUmaTile(imagem:String, posicao:CGPoint, zCoordenada : CGFloat = 20) {
        
        let sprite = SKSpriteNode(imageNamed: imagem)
        
        sprite.position = posicao
        
        sprite.anchorPoint = CGPoint(x:0, y:0)
        sprite.setScale(0.5)
        sprite.zPosition = zCoordenada
        
        buildingView.addChild(sprite)
        
    }
    
    func colocarPilastraInteiraSingular(largura : Int, alturaDoAndar : Int){
    
        let pilastraCorpo = Tile(rawValue: 19)!
        let pilastraBase = Tile(rawValue: 20)!
        let pilastraTopo = Tile(rawValue: 21)!
        
        var ponto = CGPointZero
        
        var auxiliar = 0
        var xCoordenada = largura
        var yCoordenada = Int(self.startingPosition.x + 20)

        
        ponto = CGPoint(x: xCoordenada, y: yCoordenada+40)
        colocarUmaTile(pilastraBase.image, posicao: ponto, zCoordenada: 24)
        
        while(auxiliar < (larguraPredio * 20) - 80){
            
            xCoordenada += 40
            
            ponto = CGPoint(x: xCoordenada, y: yCoordenada)
            
            colocarUmaTile(pilastraCorpo.image, posicao: ponto, zCoordenada: 21)
            
            auxiliar += 40
        }
        
        xCoordenada += 40

        ponto = CGPoint(x: xCoordenada, y: yCoordenada+40)
        colocarUmaTile(pilastraTopo.image, posicao: ponto, zCoordenada: 24)
        
        
    
    }
    
    func colocarPilastras(){
    
        var largura : Int = 40
        var altura : Int = 40
        
        for _ in 0..<qtdPilastras {
            
            largura += 160
//            colocarPilastraInteiraSingular(largura, alturaDoAndar: altura)
            
        }
    
    }
    
    func colocarJanelas(){
    
    }
    
}

