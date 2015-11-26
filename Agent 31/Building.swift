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
        default :
            return ""
        }
    }
    
}

class Building: SKNode {
    
    //    var tiles : NSMutableArray = NSMutableArray()
//    var buildingTilesMatrix = [
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//    ]
    
    let buildingView:SKSpriteNode

    let tileSize = (width:20, height:20)
    
    var larguraPredio : Int
    var alturaPredio : Int
    
    var startingPosition : CGPoint
    
    var qtdJanelas : Int = 0
    var qtdAndares : Int = 0
    
    init(largura: Int = 40, altura : Int = 38, posicaoInicial : CGPoint = CGPointMake(0, 0)) {
        
        startingPosition = posicaoInicial
        
        larguraPredio = largura
        alturaPredio = altura
        
        buildingView = SKSpriteNode()
        
        super.init()
        
        self.addChild(buildingView)
        self.colocarTodosOsTijolos()
        self.colocarBase()
        self.colocarAndares()
        self.colocarLateral()
        self.colocarTopo()
        
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
            colocarUmaTile(lateralBase.image, posicao: ponto, zCoordenada: 20)
            
            auxiliar += 20
        }
        
        ponto = CGPoint(x: Int(self.startingPosition.x - 20), y: Int(self.startingPosition.y) + 80)
        colocarUmaTile(parapeito.image, posicao: ponto, zCoordenada: 22)
    }
    
    func colocarBase(){
        
        var xCoordenada = self.startingPosition.x + 20
        var yCoordenada = self.startingPosition.y + 20
        
        var ponto = CGPoint(x: xCoordenada, y: yCoordenada)
        var tile = Tile(rawValue: 2)!
        let varandaCima = Tile(rawValue: 13)!
        let varandaCimaEquerda = Tile(rawValue: 15)!
        let varandaCimaDireita = Tile(rawValue: 16)!
        
        // colocar base da esquerda
        colocarUmaTile(tile.image, posicao: ponto, zCoordenada: 21)
        
        // auxiliar para percorrer lateralmente
        var auxiliar = 40
        
        while(auxiliar < (larguraPredio * 20) - 40){
        
            xCoordenada += 40
            
            ponto = CGPoint(x: xCoordenada, y: yCoordenada)
            tile = Tile(rawValue: 1)!
            
            // colocar base central
            colocarUmaTile(tile.image, posicao: ponto, zCoordenada: 21)
            
            auxiliar += 40
        }
        
        xCoordenada += 40

        ponto = CGPoint(x: xCoordenada, y: yCoordenada)
        tile = Tile(rawValue: 3)!
        
        // colocar base da direita
        colocarUmaTile(tile.image, posicao: ponto, zCoordenada: 21)
        
        auxiliar = 0
        xCoordenada = self.startingPosition.x + 20
        yCoordenada = self.startingPosition.y + 90

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
        
        qtdAndares = (((self.alturaPredio * 20) - 120) / 160) - 1
        print(qtdAndares)
    
        var altura : Int = 40
        
        for _ in 0..<qtdAndares {
            
            altura += 160
            colocarAndarSingular(altura)
            
        }
    }
    
    func colocarAndarSingular(altura : Int){
    
        let varandaCima = Tile(rawValue: 13)!
        let varandaBaixo = Tile(rawValue: 14)!
        let varandaEsquerda = Tile(rawValue: 15)!
        let varandaDireita = Tile(rawValue: 16)!

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
        ponto = CGPoint(x: xCoordenada, y: yCoordenada)
        colocarUmaTile(varandaDireita.image, posicao: ponto, zCoordenada: 23)
        
        // varanda esquerda
        ponto = CGPoint(x: self.startingPosition.x + 20, y: self.startingPosition.y + 90)
        colocarUmaTile(varandaEsquerda.image, posicao: ponto, zCoordenada: 22)
        
//        auxiliar = 0
//        xCoordenada = self.startingPosition.x + 20
//        yCoordenada = self.startingPosition.y + 90
//        
//        while(auxiliar < (larguraPredio * 20) - 80){
//            
//            xCoordenada += 40
//            
//            ponto = CGPoint(x: xCoordenada, y: yCoordenada)
//            colocarUmaTile(varandaCima.image, posicao: ponto, zCoordenada: 22)
//            
//            auxiliar += 40
//        }
//        
//        xCoordenada += 40
//        
//        // varanda direita
//        ponto = CGPoint(x: xCoordenada, y: yCoordenada)
//        colocarUmaTile(varandaCimaDireita.image, posicao: ponto, zCoordenada: 23)
//        
//        // varanda esquerda
//        ponto = CGPoint(x: self.startingPosition.x + 20, y: self.startingPosition.y + 90)
//        colocarUmaTile(varandaCimaEquerda.image, posicao: ponto, zCoordenada: 22)
        
    }
    
    func colocarTopo(){
        
        let tetoDireita = Tile(rawValue: 6)!
        let tetoEsquerda = Tile(rawValue: 7)!
        let chao = Tile(rawValue: 8)!
        let tetoBase = Tile(rawValue: 9)!
        
        var ponto = CGPoint(x: Int(self.startingPosition.x - 30), y: (self.alturaPredio * tileSize.width) + 0)
        colocarUmaTile(tetoEsquerda.image, posicao: ponto)

        ponto = CGPoint(x: (self.larguraPredio * tileSize.width) - 60, y: (self.alturaPredio * tileSize.width) + 20)
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
     
            ponto = CGPoint(x: xCoordenada, y: yCoordenada-20)
            colocarUmaTile(tetoBase.image, posicao: ponto, zCoordenada: 21)
            
            auxiliar += 20
        }

        
    
    }
    
    func colocarTodosOsTijolos(){
    
        for i in 0..<self.alturaPredio {
            
            for j in 0..<self.larguraPredio - 1{
                
                let tile = Tile(rawValue: 0)!
                
                let xStart : Int = j + 1;
                let yStart : Int = i + 1;
                
                let ponto = CGPoint(x: (xStart * tileSize.width), y: (yStart * tileSize.height))
                
//                if(j == self.larguraPredio - 1 && i == 0){
//                    continue
//                }
                
                colocarUmaTile(tile.image, posicao: ponto)
            
                
            }
            
        }
    
    }
    
    
    func colocarUmaTile(imagem:String, posicao:CGPoint, zCoordenada : CGFloat = 20) {
        
        let sprite = SKSpriteNode(imageNamed: imagem)
        
        sprite.position = posicao
        
        sprite.anchorPoint = CGPoint(x:0, y:0)
        sprite.setScale(0.5)
        sprite.zPosition = zCoordenada
        
        buildingView.addChild(sprite)
        
    }
    
   
    func generateNewMatrix() -> NSArray{
        
        let array = [
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ]
        
        return array
        
    }

    
    
    //    func placeAllTiles() {
    //
    //        for i in 0..<buildingTilesMatrix.count {
    //
    //            let row = buildingTilesMatrix[i]
    //
    //            for j in 0..<row.count {
    //                let tileInt = row[j]
    //
    //                let tile = Tile(rawValue: tileInt)!
    //
    //                let xStart : Int = j ;
    //                let yStart : Int = i ;
    //
    //                let ponto = CGPoint(x: (xStart * tileSize.width), y: (yStart*tileSize.height))
    //
    //
    //                colocarUmaTile(tile.image, posicao: :point)
    //
    //            }
    //            
    //        }
    //        
    //    }
    
}

