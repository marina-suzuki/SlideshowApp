//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Marina Suzuki on 2016/07/11.
//  Copyright © 2016年 Marina Suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //写真の配列
    let photos = ["背景１.jpg", "背景２.jpg", "背景３.jpg"]
    
    var photoindex:Int = 0
    
    //タイマーの作成
    var timer: NSTimer?
    
    //再生フラグ(0->停止　1->再生)
    var runFlg:String = "0"
    
    
    //進む
    @IBOutlet weak var move_on_btn: UIButton!
    @IBAction func move_on(sender: AnyObject) {
      
        photoindex = photoindex + 1
        
        if photoindex > 2{
            
            photoindex = 0
            image.image = UIImage(named: photos[photoindex])
            
        }else{
            image.image = UIImage(named: photos[photoindex])
        }
        
    }
    
    //戻る
    
    @IBOutlet weak var back_btn: UIButton!
    @IBAction func back(sender: AnyObject) {
        
        photoindex = photoindex - 1
        
        if photoindex < 0{
            
            photoindex = 2
            image.image = UIImage(named: photos[photoindex])
            
        }else{
            image.image = UIImage(named: photos[photoindex])
        }
    }
    
    //再生/停止
    
    @IBOutlet weak var run_stop_btn: UIButton!
    @IBAction func run_stop(sender: AnyObject) {
        
        //もし停止してるなら
        if runFlg == "0"{
            
            //フラグに１を入れる
            runFlg = "1"
        
            //進む、戻るボタンの使用不可
            move_on_btn.enabled = false
            back_btn.enabled = false
        
            // タイマーを設定
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
           
            //ボタンのタイトル変更.
            run_stop_btn.setTitle("停止", forState: .Normal)
            
        
        //もし再生中なら
        }else{
            
            //フラグに0を入れる
            runFlg = "0"
            
            //進む、戻るボタンの使用可
            move_on_btn.enabled = true
            back_btn.enabled = true
            
            //timerを破棄する.
            timer?.invalidate()
            
            //ボタンのタイトル変更.
            run_stop_btn.setTitle("再生", forState: .Normal)
            
        }
        
        
    }
    
    //画像表示
    @IBOutlet weak var image: UIImageView!
    
    //値を渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        //imageViewControllerに値を渡す
        let imageViewController:ImageViewController = segue.destinationViewController as! ImageViewController
        
        //画像のindex
        imageViewController.index = photoindex
    
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初期画像はphotos[0]
        image.image = UIImage(named: photos[photoindex])
        
        
    }
    
    /// NSTimerによって、一定の間隔で呼び出される関数
    func onTimer(timer: NSTimer) {
        
        photoindex = photoindex + 1
        
        if photoindex > 2{
            
            photoindex = 0
            image.image = UIImage(named: photos[photoindex])
            
        }else{
            image.image = UIImage(named: photos[photoindex])
        }

        
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

