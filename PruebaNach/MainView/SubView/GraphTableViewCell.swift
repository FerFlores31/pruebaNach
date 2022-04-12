//
//  GraphTableViewCell.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import UIKit

class GraphTableViewCell: UITableViewCell {

    lazy  var texLabel: UILabel = {
        let label = UILabel()
       label.text = "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)."
        label.textColor = .black
        label.numberOfLines = 20
        label.font = UIFont(name: "Helvetiva", size: 15)
        return label
    }()
    
    init(){
        super.init(style: .default, reuseIdentifier: nil)
      
        initUI()
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(texLabel)
        texLabel.addAnchors(left: 10, top: 10, right: 10, bottom: 10)
        
    }


}
