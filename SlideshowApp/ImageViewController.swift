//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by Marina Suzuki on 2016/07/13.
//  Copyright © 2016年 Marina Suzuki. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController: UIViewController {
    
    //ViewControllerから画像のインデックスを受け取る変数
    var index:Int = 0
    
    //写真の配列
    let photos = ["背景１.jpg", "背景２.jpg", "背景３.jpg"]
    
    
    //画像表示
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("^^^^^^^^^^^")
        print(index)
        
        image.image = UIImage(named: photos[index])
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
