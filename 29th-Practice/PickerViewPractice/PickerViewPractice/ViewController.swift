//
//  ViewController.swift
//  PickerViewPractice
//
//  Created by 김수연 on 2021/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myImageNamePickerView: UIPickerView!
    
    var imageList : [MyImageData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMyImageData()
        initImageLayout()
        myImageNamePickerView.dataSource = self
        myImageNamePickerView.delegate = self
    }
    
    func initMyImageData(){
        imageList.append(contentsOf: [
            MyImageData(imageFileName: "hams", imageTitleName: "햄스터"),
            MyImageData(imageFileName: "photo", imageTitleName: "취업사진"),
            MyImageData(imageFileName: "starbucks", imageTitleName: "스타벅스"),
            MyImageData(imageFileName: "zoom", imageTitleName: "줌사진"),
            MyImageData(imageFileName: "food", imageTitleName: "음식"),
            MyImageData(imageFileName: "flower", imageTitleName: "꽃")
        ])
    }
    
    func initImageLayout(){
        myImageView.image = imageList[0].makeImage()
        imageNameLabel.text = imageList[0].imageTitleName
    }
}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageList.count
    }
    
    
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageList[row].imageTitleName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myImageView.image = imageList[row].makeImage()
        imageNameLabel.text = imageList[row].imageTitleName
    }
    
}

