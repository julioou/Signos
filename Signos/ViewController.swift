//
//  ViewController.swift
//  Signos
//
//  Created by Treinamento on 9/17/19.
//  Copyright © 2019 JCAS. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let sm = SignosModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.rowHeight = 58
        
    }
    
    //Definindo a quantidad de células.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sm.signosArray.count
    }
    
    //Criação das células.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lista = sm.signosArray
        let signoListado = lista[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "signosCell", for: indexPath)
        cell.textLabel?.text = signoListado

        return cell
    }
    
    //Quando o usuário selecionar algumas das células ira acionar um popup de alerta que ira
    //retornar o array de significados conforme a selecão.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let lista = sm.signosArray
        let significados = sm.significadosArray
        let signoListado = lista[indexPath.row]
        let significadoListado = significados[indexPath.row]
        
        let alerta = UIAlertController(title: signoListado, message: significadoListado, preferredStyle: .alert)
        let alertaAction = UIAlertAction(title:"Fechar", style: .default, handler: nil)
        alerta.addAction(alertaAction)
        present(alerta, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }


}

