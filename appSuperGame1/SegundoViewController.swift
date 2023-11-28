//
//  SegundoViewController.swift
//  appSuperGame1
//
//  Created by Omar Tapia on 27/11/23.
//

import UIKit

class SegundoViewController: UIViewController {

    @IBOutlet weak var lblBandera: UILabel!
    
    @IBOutlet weak var lblCostumbres: UILabel!
    
    @IBOutlet weak var txtPais: UITextField!
    
    @IBOutlet weak var switchBtn: UISwitch!
    
    @IBOutlet weak var vida1: UIImageView!
    @IBOutlet weak var vida2: UIImageView!
    @IBOutlet weak var vida3: UIImageView!
    
    var vidas = 3
    
   // var paisBandera = ["México":"🇲🇽","USA":"🇺🇸","Brazil":"🇧🇷","Japón":"🇯🇵"]
    var paisBandera = [
        "Mexico": "🇲🇽",
        "USA": "🇺🇸",
        "Brazil": "🇧🇷",
        "Japan": "🇯🇵",
        "France": "🇫🇷",
        "Italy": "🇮🇹",
        "Germany": "🇩🇪",
        "India": "🇮🇳",
        "China": "🇨🇳",
        "Australia": "🇦🇺",
        "Sweden": "🇸🇪",
        "Norway": "🇳🇴",
        "Denmark": "🇩🇰",
        "Finland": "🇫🇮",
        "Switzerland": "🇨🇭",
        "Netherlands": "🇳🇱",
        "Belgium": "🇧🇪",
        "Portugal": "🇵🇹",
        "Greece": "🇬🇷",
        "Ireland": "🇮🇪"
    ]
   // var paisEmoji = ["México":"🤠🌮","USA":"🧑🏻‍🎄🍔","Brazil":"🕺🏾🍖","Japón":"🎎🍣"]
    
    var paisEmoji = [
        "Mexico": "🤠🌮",
        "USA": "🧑🏻‍🎄🍔",
        "Brazil": "🕺🏾🍖",
        "Japan": "🎎🍣",
        "France": "🥖🍷",
        "Italy": "🍕🍝",
        "Germany": "🍺🥨",
        "India": "🕌🍛",
        "China": "🐉🥢",
        "Australia": "🦘🍤",
        "Sweden": "🇸🇪🏰",
        "Norway": "🇳🇴🏔️",
        "Denmark": "🇩🇰🏰",
        "Finland": "🇫🇮❄️",
        "Switzerland": "🇨🇭⛰️",
        "Netherlands": "🇳🇱🌷",
        "Belgium": "🇧🇪🍫",
        "Portugal": "🇵🇹🏰",
        "Greece": "🇬🇷🏛️",
        "Ireland": "🇮🇪☘️"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOutside(_:)))
        self.view.addGestureRecognizer(tapGesture)
        inicializar()
        // Do any additional setup after loading the view.
    }
    
    //Para ocultar teclado
    @objc func tapOutside(_ gestureRecognizer: UITapGestureRecognizer) {
           // Oculta el teclado
           self.view.endEditing(true)
       }
    @IBAction func btnJugarPaises(_ sender: Any) {
     
        let bandera = lblBandera.text ?? ""
         
         if let pais = obtenerPaisPorBandera(bandera), pais == txtPais.text {
             gameWin()
             inicializar()
             let nuevaBandera = obtenerBanderaAleatoria()
             lblBandera.text = nuevaBandera
             pistas()
             
         } else{
             
             vidas-=1
             if(vidas == 2){
                 gameWrong()
                 lblBandera.text = obtenerBanderaAleatoria()
                 vida3.isHidden = true
                 self.view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                 pistas()
                 
             }else if(vidas == 1){
                 gameWrong()
                 vida2.isHidden = true
                 lblBandera.text = obtenerBanderaAleatoria()
                 self.view.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                 pistas()
               
             }else if(vidas == 0){
                 vida1.isHidden = true
                 gameLost()
                 restablecerVidas()
                 pistas()
                 inicializar()
             }
             
             
         }
        
        
    }
    
    func pistas(){
        
        if switchBtn.isOn {
            lblCostumbres.isHidden = false
            let paisB = obtenerPaisPorBandera(lblBandera.text!)!
            let costumbre = obtenerCostumbres(paisB)
            lblCostumbres.text = costumbre
        }else
        {
            lblCostumbres.isHidden = true
        }
        
    }
    
    func restablecerVidas(){
        vida1.isHidden = false
        vida2.isHidden = false
        vida3.isHidden = false
        
    }
    
    func obtenerPaisPorBandera(_ bandera: String) -> String? {
        // Realiza una búsqueda inversa en el diccionario para encontrar el país correspondiente a la bandera
        for (pais, banderaEnDiccionario) in paisBandera {
            if banderaEnDiccionario == bandera {
                return pais
            }
        }
        return nil
    }
    /*
    func obtenerCostumbrePorPais(_ nombre: String) -> String? {
        // Realiza una búsqueda inversa en el diccionario para encontrar el país correspondiente a la bandera
        for (pais, costumbreEnDiccionario) in paisEmoji {
            if pais == nombre {
                return costumbreEnDiccionario
            }
        }
        return nil
    }*/
    
    
    func obtenerCostumbres(_ nombre: String) -> String? {
        // Realiza una búsqueda inversa en el diccionario para encontrar el país correspondiente a la bandera
        for (pais, costumbre) in paisEmoji {
            if pais == nombre {
                return costumbre
            }
        }
        return nil
    }
    
    
    
    func inicializar()
    {
        lblBandera.text = obtenerBanderaAleatoria()
        self.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
    }
    
    func gameWin()
    {
        let costumbre = obtenerCostumbres(txtPais.text!)!
        let alerta = UIAlertController(title: lblBandera.text, message: "Felicidades"+costumbre, preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Juega de nuevo", style: .default)
       
       
             alerta.addAction(jugarOtraVez)
             self.present(alerta, animated: true,completion: nil)
            
    }
    
    func gameWrong()
    {
        let alerta = UIAlertController(title: txtPais.text, message: "Incorrecto 🤥", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Juega de nuevo", style: .default)
       
       
             alerta.addAction(jugarOtraVez)
             self.present(alerta, animated: true,completion: nil)
            
    }
    
    func gameLost()
    {
        let alerta = UIAlertController(title: txtPais.text, message: "Perdiste jaja", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Reiniciar", style: .default)
       
       
             alerta.addAction(jugarOtraVez)
             self.present(alerta, animated: true,completion: nil)
            
    }
   
    // Función para obtener una bandera aleatoria
    func obtenerBanderaAleatoria() -> String {
        let banderas = Array(paisBandera.values)
        let banderaAleatoria = banderas.randomElement()!
        return banderaAleatoria
    }
    
  

}
