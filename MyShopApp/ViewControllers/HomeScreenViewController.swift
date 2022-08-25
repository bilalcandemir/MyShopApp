//
//  HomeScreenViewController.swift
//  MyShopApp
//
//  Created by Bilal Candemir on 8/1/22.
//

import UIKit

struct Mock {
    var productName:String
    var productPrice:Float
}

class HomeScreenViewController: UIViewController {
    
    var dataArray = [Mock]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMockData()
        
        setTableView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
   
    }
    
    func addMockData(){
        var data = Mock(productName: "Apple Iphone 11", productPrice: 15.050)
        dataArray.append(data)
        data = Mock(productName: "Apple MacbookPro", productPrice: 45.000)
        dataArray.append(data)
        data = Mock(productName: "Apple Airpods Pro", productPrice: 3.500)
        dataArray.append(data)
        data = Mock(productName: "Apple Ipad Air", productPrice: 20.000)
        dataArray.append(data)
        
    }
    
    func setTableView(){
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
    }


}

extension HomeScreenViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCell
        cell.setCell(item: dataArray[indexPath.row])
        return cell
    }
    
    
}

