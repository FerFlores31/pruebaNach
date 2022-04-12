//
//  RouterGraphics.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import Foundation
import UIKit

public class GraphicsRouter{
   
   public static func startGraphics() -> UIViewController{
       

       let view = GraViewController()
       let presenter: GraphicsViewToPresenterProtocol &  GraphicsInteractorToPresenterProtocol = PresenterGraphics()
       let interactor: GraphicsPresenterToInteractorProtocol = CharInteractor()
       let router: GraphicsPresenterToRouter = GraphicsRouter()
              
       view.presenter = presenter
       presenter._view = view
       presenter._interactor = interactor
       presenter._router = router
       interactor.presenter = presenter
                 
       return view
       
   }
   
   
}


extension GraphicsRouter: GraphicsPresenterToRouter {

}
