//
//  ProtocolGraphics.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import Foundation

protocol GraphicsInteractorToPresenterProtocol: class {
    
    
    func GraphicsDidFinishWith(item: ChartObject)
    func GraphicsDidFinishWith(error: Error?)
  
}

protocol GraphicsViewToPresenterProtocol: class {
    var _view: GraphicsPresenterToViewProtocol? { get set }
    var _interactor: GraphicsPresenterToInteractorProtocol? { get set }
    var _router: GraphicsPresenterToRouter? { get set }
    
 
    func goToGraphics()  

   
    
}

protocol GraphicsPresenterToViewProtocol: class {
    var presenter : GraphicsViewToPresenterProtocol? {set get}
    func GraphicsDidFinishWith(item: ChartObject)
    func GraphicsDidFinishWith(error: Error?)


    
}

protocol GraphicsPresenterToInteractorProtocol: class {
    var presenter: GraphicsInteractorToPresenterProtocol? {set get}
    
    func getGraphics()

    
}

protocol GraphicsPresenterToRouter: class {
  
    
}
