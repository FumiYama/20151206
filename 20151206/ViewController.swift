//
//  ViewController.swift
//  20151206
//
//  Created by Fumiya Yamanaka on 2015/12/06.
//  Copyright © 2015年 Fumiya Yamanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var msv_myScrollView: UIScrollView!

    @IBOutlet var sv_scrollView:UIScrollView!
    var ph_pageHeight:CGFloat!
    var pw_pageWidth:CGFloat!
    
    let pn_pageNumber:Int = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let vfsw_viewFrameSizeWidth = self.view.frame.size.width
        let vfsh_viewFrameSizeHeight = self.view.frame.size.height
        
        
        /////////////////////////////////////// swift Docs
        msv_myScrollView = UIScrollView()
        
        msv_myScrollView.frame = CGRectMake(0, 0, vfsw_viewFrameSizeWidth, vfsh_viewFrameSizeHeight)
        let myImage = UIImage(named: "068ae99f-s.jpg")!
        let miv_myImageView = UIImageView()
        miv_myImageView.image = myImage
        miv_myImageView.frame = CGRectMake(0, 0, myImage.size.width, myImage.size.height)
        
        msv_myScrollView.addSubview(miv_myImageView)
        
        msv_myScrollView.contentSize = CGSizeMake(miv_myImageView.frame.size.width, miv_myImageView.frame.size.height)
        
        msv_myScrollView.pagingEnabled = true // スライド falseにするとスクロール,
//        self.view.addSubview(msv_myScrollView)
        
        //////////////////////////////////////////////////////////////////////[Swift] UIScrollView ページ スクロール/ https://akira-watson.com/iphone/uiscrollview_page_scroll.html
        let ss_screenSize: CGRect = UIScreen.mainScreen().bounds
        pw_pageWidth = ss_screenSize.width
        
        let image1:UIImage = UIImage(named: "1.jpg")!
        let iw_imageWidth = image1.size.width
        let ih_imageHeight = image1.size.height
        ph_pageHeight = pw_pageWidth * ih_imageHeight / iw_imageWidth
        
        for var i=0; i < pn_pageNumber; i++ {
            let n:Int = i+1
            // UIImageViewのいんすたんす
            let image:UIImage = UIImage(named: "\(n).jpg")!
            let iv_imageView = UIImageView(image: image)
            
            var rect:CGRect = iv_imageView.frame
            rect.size.height = ph_pageHeight
            rect.size.width = pw_pageWidth
            iv_imageView.frame = rect
            iv_imageView.tag = n
            // UIScrollViewのインスタンスに画像を貼付ける
            self.sv_scrollView.addSubview(iv_imageView)
        }
        
        setUpScrollImages()
        
    }
    
    func setUpScrollImages() {
        let imageDummy:UIImage = UIImage(named:"068ae99f-s.jpg")! // ダミー画像
        var iv_imageView = UIImageView(image: imageDummy)
        var subviews:Array = sv_scrollView.subviews
        // 描画開始位置
        var px:CGFloat = 0.0
        let py:CGFloat = 100.0
        
        for var i=0; i < subviews.count; i++ {
            iv_imageView = subviews[i] as! UIImageView
            if (iv_imageView.isKindOfClass(UIImageView) && iv_imageView.tag > 0) {
                var vf_viewFrame:CGRect = iv_imageView.frame
                vf_viewFrame.origin = CGPointMake(px, py)
                iv_imageView.frame = vf_viewFrame
                
                px += (pw_pageWidth)
            }
        }
        
        // UIScrollViewのコンテンツサイズを画像のtotalサイズに合わせる
        let nWidth:CGFloat = pw_pageWidth * CGFloat(pn_pageNumber)
        sv_scrollView.contentSize = CGSizeMake(nWidth, ph_pageHeight)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

