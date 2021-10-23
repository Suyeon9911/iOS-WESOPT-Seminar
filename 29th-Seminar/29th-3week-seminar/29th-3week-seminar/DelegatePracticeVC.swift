//
//  DelegatePracticeVC.swift
//  29th-3week-seminar
//
//  Created by 김수연 on 2021/10/23.
//

import UIKit

class DelegatePracticeVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var partPickerView: UIPickerView!
    
    var partList : [PartData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        initPartData()
        initPartLayout()
        partPickerView.dataSource = self
        partPickerView.delegate = self
    }
    
    func initPartData(){
        partList.append(contentsOf: [
            PartData(imageName: "wesoptiOSPart", partName: "iOS"),
            PartData(imageName: "wesoptAndroidPart", partName: "Android"),
            PartData(imageName: "wesoptWebPart", partName: "Web"),
            PartData(imageName: "wesoptServerPart", partName: "Server"),
            PartData(imageName: "wesoptDesignPart", partName: "Design"),
            PartData(imageName: "wesoptPlanPart", partName: "Plan")
        ])
    }
    func initPartLayout(){
        partImageView.image = partList[0].makeImage()
        textField.text = partList[0].partName
    }

}

extension DelegatePracticeVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.endEditing(true)
        return true
    }
}

extension DelegatePracticeVC: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // Pickerview의 컴포넌트 숫자를 지정해주는 메서드
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Pickerview의 각 컴포넌트에서 행의 개수를 지정해주는 메서드
        // partList의 데ㅣ터 개수 만큼의 행이 필요
        return partList.count
    }
    
    
}

extension DelegatePracticeVC: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // partList에서 row번째에 있는 PartData의 partName으로 title 설정
        return partList[row].partName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // partList에서 row 번째에 있는 PartData의 UIimage를 가져오는 함수 호출
        // partImageView의 이미지로 설정
        partImageView.image = partList[row].makeImage()
        
        textField.text = partList[row].partName
    }
}
