//
//  TeoriaViewController.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import UIKit

class TeoriaViewController: UIViewController {
    
    lazy var teoriaLabel : UILabel = {
        let label = UILabel()
        label.text = "Explique el ciclo de vida de un view controller \n 1.- viewDidLoad \n 2.- viewWillAppear \n 3.- viewDidAppear \n 4.- viewWillDisapeaar \n 5.- viewDidDisappear \n \n Explique el ciclo de vida de una aplicacion \n 1.- No se esta ejecutando \n 2.- Inactivo \n 3.- Activo \n 4.- Fondo \n 5.- Suspendida \n \n En que casos se usa weak, un strong y un unowned \n \n Que es el ARC \n 1.- Es el conteo automatico de referencias, se encarga de contar las referencias que tiene un objeto para que cuando  \n este no tenga sea eliminado de memoria"
        label.textColor = .black
        label.numberOfLines = 100
        label.font = UIFont(name: "Helvetica", size: 10)
        return label
        
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
    }
  

    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        initUI()

   
    }
    
    func initUI(){
 
        view.addSubview(teoriaLabel)
        teoriaLabel.addAnchors(left: 10, top: 10, right: 10, bottom: nil)
        
    }



}
