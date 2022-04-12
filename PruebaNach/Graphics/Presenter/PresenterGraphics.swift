//
//  PresenterGraphics.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import Foundation

class PresenterGraphics : GraphicsViewToPresenterProtocol{
    
    var _view: GraphicsPresenterToViewProtocol?
    var _interactor: GraphicsPresenterToInteractorProtocol?
    var _router: GraphicsPresenterToRouter?
    
    
    func goToGraphics() {
        _interactor?.getGraphics()
    }

    
}


extension PresenterGraphics : GraphicsInteractorToPresenterProtocol{

    func GraphicsDidFinishWith(item: ChartObject) {
        _view?.GraphicsDidFinishWith(item: item)
    }
    
    func GraphicsDidFinishWith(error: Error?) {
        _view?.GraphicsDidFinishWith(error: error)
    }
    
}
