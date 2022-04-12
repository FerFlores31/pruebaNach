//
//  GraViewController.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import UIKit

import Charts

class GraViewController: UIViewController {
   
    
    var presenter: GraphicsViewToPresenterProtocol?
      
    var dataSource : ChartObject?
    
    lazy var graphTableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        presenter!.goToGraphics()
 
    }
    
    
    func initUI(){
        graphTableView.delegate = self
        graphTableView.dataSource = self
        view.addSubview(graphTableView)
        graphTableView.addAnchors(left: 0, top: 0, right: 0, bottom: 0)
        
    }
}


extension GraViewController :  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = GrapTableViewCell(question: (dataSource?.questions![indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    
}

extension GraViewController : GraphicsPresenterToViewProtocol {
    func GraphicsDidFinishWith(item: ChartObject) {
         dataSource = item
         graphTableView.reloadData()
    }
    
    func GraphicsDidFinishWith(error: Error?) {
        
    }
    
    
}
