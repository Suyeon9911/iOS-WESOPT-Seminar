

**📌 Delegate ? 위임하다. 할 일을 분배해서 다른 사람에게 해당 일을 위임 시킨 후 그 일이 들어오면 맡은 사람이 한다는 것 !** 

**📌 Protocol ? 특정한 작업이나 기능 부분적인 부분에 적합한 메소드, 프로퍼티, 그리고 다른 요구사항의 청사진을 정의** 

- 프로토콜을 클래스, 구조체, 열거형에서 채택하여 해당 요구사항의 실제 구현 제공
- 프로토콜에서는 해야할일을 정의만 하고 구현은 프로토콜을 채택한 객체에서 이루어짐
- 많이 사용하는 uikit의 delegate들도 모두 protocol로 되어있음 !

### 💡 Delegate Pattern

- 객체지향 프로그래밍에서 하나의 객체가 모든 일을 처리하는 것이 아니라 처리해야 하는 일 중 일부를 다른 객체에게 넘기는 것
- 주로 프레임워크 객체가 위임을 요청하며, 커스텀 컨트롤러 객체가 위임을 받아 특정 이벤트에 대한 기능을 구현
- 커스텀 컨트롤러에서 세부 동작을 구현함으로써 동일한 동작에 대해 다양한 대응을 할 수 있게 해줌


### ✅ UITextFieldDelegate

- 텍스트 필드 개체의 텍스트 편집 및 유효성 검사를 관리하는 선택적 메서드 집합
- 다양한 메서드들 존재 → 벨로그에 정리해둠 ㅋㅋㅋ

**📌 Extension? 스위프트의 강력한 기능 중 하나로 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있음. 그러나 기존에 존재하는 기능을 재정의 할 수는 없다.**


### ✅ UIPickerView

- wheel 모양으로 된 항목들이 회전하면서 값을 선택할 수 있는 UI
- pickerview를 사용하기 위해서는 2가지의 프로토콜을 채택해야함 !
- UIPickerViewDataSource : 데이터를 제어하는 기능 protocol
- UIPickerViewDelegate :  사용자 인터페이스(동작처리) 제어하는 기능 프로토콜


**📌 UIPickerView에서 구현해야할 프로토콜** 

UIPickerViewDataSource에는 optional이 붙지 않은, 필수적으로 구현해야하는 함수들이 존재 ! ( 처음에 오류가 뜨는 이유 ! ) 

1. UIPickerViewDataSource 
   - numberOfComponents : 피커뷰의 컴포넌트 숫자를 지정해주는 메소드
   - pickerView (_ ... , numberOfRowsInComponent ..) : 피커뷰의 각 컴포넌트에서 행의 개수를 지정해 주는 메소드
        
   - 마지막으로 partPickerView.dataSource = self 해주면 끝 
    
2. UIPickerViewDelegate 

  - title을 치면 titleForRow가 나옴. 클릭해서 메소드 추가
  - didSelect 치면 didSelectRow 나옴. 추가
