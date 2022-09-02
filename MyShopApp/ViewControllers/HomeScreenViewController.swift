//
//  HomeScreenViewController.swift
//  MyShopApp
//
//  Created by Bilal Candemir on 8/1/22.
//

import UIKit


enum HomeType:Int {
    case imageSlider = 0, normalCell = 1, space = 2
}

struct CollectionViewMock {
    var imageName:String
    var description:String
}

struct tableViewMock {
    var productName:String
    var productPrice:Float
}

struct Mock {
    var type:HomeType
    var name:String
    var items:[Any]
}


class HomeScreenViewController: UIViewController {
    
    var itemsArray = [Mock]()
    var collectionViewArray = [CollectionViewMock]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMockData()
        setTableView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
   
    }
    
    func addMockData(){
        var collectionItem = CollectionViewMock(imageName: "iphone13", description: "Yepyeni Iphone Sizlerle")
        collectionViewArray.append(collectionItem)
        collectionItem = CollectionViewMock(imageName: "airpods", description: "Airpods Pro Sizlerle")
        collectionViewArray.append(collectionItem)
        
        let item = Mock(type: .imageSlider, name: "image Slider", items: collectionViewArray)
        itemsArray.append(item)
        
    }
    
    func setTableView(){
        tableView.register(UINib(nibName: "ImageSliderTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageSliderTableViewCell")
    }
    
    func createCollectionView(height: CGFloat) -> UICollectionView {
        let nibName = "SliderCollectionViewCell"
        
        let width = UIWindow().screen.bounds.width
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionHeadersPinToVisibleBounds = true
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: width, height: height)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: width, height: height), collectionViewLayout: layout)
        collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }


}

extension HomeScreenViewController:UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemsArray[indexPath.row]
        
        if item.type == .imageSlider {
            let collectionView = createCollectionView(height: 200)
            collectionView.delegate = self
            collectionView.dataSource = self
                
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageSliderTableViewCell") as! ImageSliderTableViewCell
            cell.addSubview(collectionView)
            cell.configureCell()
            return cell
        }
        
        else {
            let cell = UITableViewCell()
            return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = itemsArray[indexPath.row]
        if item.type == .imageSlider {
            return 200
        }
        
        else {
            return 50
        }
        
    }
    
    
}


extension HomeScreenViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
        cell.setCell(collectionViewArray[indexPath.row])
        return cell
    }
    
    
    
    
}

