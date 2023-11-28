//
//  ViewController.swift
//  appSuperGame1
//
//  Created by Omar Tapia on 13/11/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtNumero: UITextField!
    
    @IBOutlet weak var lblMensaje: UILabel!
    
    @IBOutlet weak var lblIntentos: UILabel!
    
    var numRandom = 0
    var intento = 0
    var numeroTxt = 0
    
    @IBAction func btnJugar(_ sender: UIButton) {
        if(txtNumero.text == String(numRandom)){
            lblMensaje.text = "Numero correcto 🍻"
            let color = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            self.view.backgroundColor = color
            gameWin()
            inicializar()
        }
        else {
            if intento == 1{
                lblMensaje.text = "Fallaste , intentalo de nuevo"
                self.view.backgroundColor = #colorLiteral(red: 0.9963333011, green: 0.002462162869, blue: 0.09338728338, alpha: 1)
                alerta()
            }
            
        else {
            numeroTxt = Int((txtNumero.text?.codingKey.intValue)!)
            if numeroTxt > numRandom
            {
                gameHelpMore()
            }else if numeroTxt < numRandom
            {
                gameHelpLess()
            }
                            
            
                intento -= 1
                lblIntentos.text = String(intento)
                lblMensaje.text = "Vuelve a jugar"
                txtNumero.text = ""
                
            }
                
        }
    }
    
    
    @IBAction func btnOtro(_ sender: UIButton) {
        //inicializar
        self.viewDidLoad()
    }
    
    @IBAction func btnSalir(_ sender: UIButton) {
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
    }
    func alerta()
    {
        let alerta = UIAlertController(title: "💔", message: "Vuelve a intentar", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Juega de nuevo", style: .default)
        {
            (UIAlertAction) in self.inicializar()
            
        }
       
             alerta.addAction(jugarOtraVez)
             self.present(alerta, animated: true,completion: nil)
             
            
    }
    
    func gameWin()
    {
        let alerta = UIAlertController(title: "👏🏼🤖", message: "FELICIDADES!!", preferredStyle: .alert)
        
      
        
        let jugarOtraVez = UIAlertAction(title: "Prueba a jugar otra vez", style: .default)
       
       
             alerta.addAction(jugarOtraVez)
             self.present(alerta, animated: true,completion: nil)
             
            
    }
    
    
    func gameHelpMore()
    {
        let alerta = UIAlertController(title: "👇🏼", message: "El numero es menor", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Juega de nuevo", style: .default)
        
           // (UIAlertAction) in self.inicializar()
            
        
       
             alerta.addAction(jugarOtraVez)
             self.present(alerta, animated: true,completion: nil)
             
            
    }
    
    func gameHelpLess()
    {
        let alerta = UIAlertController(title: "☝🏼", message: "El numero es mayor", preferredStyle: .alert)
        
        let jugarOtraVez = UIAlertAction(title: "Juega de nuevo", style: .default)
       
       
             alerta.addAction(jugarOtraVez)
             self.present(alerta, animated: true,completion: nil)
             
            
    }
    
    
             
    func inicializar()
    {
            numRandom = Int(arc4random_uniform(10))
            txtNumero.text = ""
            intento = 5
            lblIntentos.text = String(intento)
            lblMensaje.text = "Numero del 0-9"
            //let color = UIColor(_colorLiteralRed: 0.5, green: 0.7, blue: 0.33, alpha: 1.0)
        let color = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.view.backgroundColor = color
    }
    
    // Do any additional setup after loading the view.
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Configurar el Gesture Recognizer
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOutside(_:)))
               self.view.addGestureRecognizer(tapGesture)
        inicializar()
    }
    
    @IBAction func btnPaisesGame(_ sender: UIButton) {
        performSegue(withIdentifier: "segue1", sender: self)
    }
    //Para ocultar teclado
    @objc func tapOutside(_ gestureRecognizer: UITapGestureRecognizer) {
           // Oculta el teclado
           self.view.endEditing(true)
       }
    
    /*
     Tarea domingo :
     1)superjuego modificado utilizando su creatividad
     2)app Sobrecarga de operadores
     3)?
     */
    


}

