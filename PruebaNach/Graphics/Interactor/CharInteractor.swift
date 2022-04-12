//
//  CharInteractor.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import Foundation

protocol InteractorDelegate{
    func responseData(response : ChartObject)
}

class CharInteractor: NSObject, URLSessionDelegate,URLSessionDataDelegate,GraphicsPresenterToInteractorProtocol {
    
    var delegate : InteractorDelegate?
    var presenter: GraphicsInteractorToPresenterProtocol?
    var dataTask : URLSessionDataTask!
    var responseData : Data = Data()
    var httpResponse : HTTPURLResponse!
    
    override init() {
        super.init()
    }
    
    
    func getGraphics(){
        
        let urlString = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld"
        let url = URL(string: urlString)!
        
        var  request = URLRequest(url: url)
        request.timeoutInterval = 90
        request.httpMethod = "GET"
        
        let sessionConfoguration = URLSessionConfiguration.default
        let defaultSession = URLSession(configuration: sessionConfoguration, delegate: self, delegateQueue:    OperationQueue.main)
        
        dataTask = defaultSession.dataTask(with: request)
        dataTask.resume()
        responseData = Data()
        
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error == nil{
            
            print(httpResponse.statusCode)
            if httpResponse.statusCode == 200{
              
                let response = String(data: responseData, encoding: String.Encoding.utf8)
                if let _ = response{
                    
                    do{
                        let responseLogin = try
                            JSONDecoder().decode(ChartObject.self, from: responseData)
                        
                        print("Respuesta Ok\(responseLogin)")
                        presenter!.GraphicsDidFinishWith(item: responseLogin)
                        
                    }catch{
                        
                        print("Error creando objetos \(error)")
                    }
                    
                    
                    
                }else{
                    
                    print("Error en crear string\(error)")
                }
                
            }else{
                print("http diferente de 200\(error)")
            }
        }else{
            print("El error no fue nil\(error)")
        }
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        responseData.append(data)
    }
  
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        httpResponse = response as? HTTPURLResponse
        completionHandler(URLSession.ResponseDisposition.allow)
    }
}
