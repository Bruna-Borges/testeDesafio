//
//  ViewController.swift
//  contrato
//
//  Created by Bruna Silva Borges on 22/02/22.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var cargoTextField: UITextField!
    @IBOutlet weak var salarioTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func imprimeDesconto(nomeFuncionario: String, salariotlt: Double){
        resultadoLabel.text = "\(nomeFuncionario), salario: R$\(salariotlt)"
    }
    
   //Calculo do salario com base no cargo
    func confereDesconto(cargo: String, salario: Double) -> Double{
                

        
        if cargo == "Dev"{
            if salario > 3000{
                return descontoSalario(salario: salario, desconto: 20)
            }else{
                return descontoSalario(salario: salario, desconto: 10)
            }
        }
        else if cargo == "DBA" {
            if salario > 2500{
                return descontoSalario(salario: salario, desconto: 25)
            }else{
                return descontoSalario(salario: salario, desconto: 15)
            }
        }
        
        else if cargo == "Testador"{
            if salario > 2500{
                return descontoSalario(salario: salario, desconto: 25) / 100
            }else{
                return descontoSalario(salario: salario, desconto: 15) / 100
            }
        }
        else if cargo == "Gerente"{
            if salario > 7000{
                return descontoSalario(salario: salario, desconto: 23) / 100
            }else{
                return descontoSalario(salario: salario, desconto: 18) / 100
            }
        }else{
            fatalError("Error")
        }
    }
    
    func descontoSalario(salario: Double, desconto: Double) -> Double{
        let desconto = desconto/100
        let salario = salario - salario*desconto

        return salario
    }
    

    func alertas(){
       resultadoLabel.text = "Insira seu nome"
       resultadoLabel.text = "Insira seu salario"
    }
    
    
    @IBAction func calcularButton(_ sender: Any) {
        guard let nome = nomeTextField?.text else{
         
            return
        }
        
        guard let cargo = cargoTextField.text else {
            fatalError("Error")
            
        }
        
        guard let salario = salarioTextField?.text else {
          
            return
        }
        
        let salarioLiquido = confereDesconto(cargo: cargo, salario: Double(salario)!)
        
        imprimeDesconto(nomeFuncionario: nome, salariotlt: salarioLiquido)
    }
}




















