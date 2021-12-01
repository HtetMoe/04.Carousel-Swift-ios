//
//  ViewController.swift
//  PageControl
//  https://www.youtube.com/watch?v=CaC8SBNMfNg
//  Created by Htet Moe Phyu on 01/12/2021.

import UIKit

class ViewController: UIViewController{
    
    //outlets Init
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var imgArray = [UIImage(named: "img1"),
                    UIImage(named: "img2"),
                    UIImage(named: "img3"),
                    UIImage(named: "img4"),
                    UIImage(named: "img5")]
    
    //scroll page control
    var timer : Timer?
    var currentCellIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = imgArray.count
        
        startTimer()
    }

    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNext), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNext(){
        
        if(currentCellIndex < imgArray.count - 1){
            currentCellIndex += 1
        }
        else{
            currentCellIndex = 0
        }
        
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
    }
}

//deligate and datasource
extension ViewController :UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.imgView.image = imgArray[indexPath.row]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

