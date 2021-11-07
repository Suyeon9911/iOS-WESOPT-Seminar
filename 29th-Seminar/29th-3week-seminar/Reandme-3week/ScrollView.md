## 📌 ScrollView란 ? 

- 말 그대로 사용자의 손가락에 따라 스크롤 기능을 구현하는 뷰
- 스크롤 기능을 통해 상하좌우로 움직이며 추가 컨텐츠를 보여주는 뷰
- UIScrollView는 오늘 배울 UITableView, UICollectionView의 SuperClass ! 
<br/>

### ✨ scrollview의 2개의 layout guide (instance property)
1. frameLayoutGuide : 실제 화면에 보여지는 부분에 대한 layout
2. contentLayoutGuide : 스크롤 될 content 전체에 대한 layout

### ✨ Priority
- 제약조건의 우선순위를 나타내는 NSLayoutConstraint의 instance property 
- 더 높은 우선 순위 제약 조건은 낮은 우선 순위 제약 조건보다 먼저 충족됨 ! 
- Priority는 1~1000 사이의 값을 가지고 있는데 값이 크면 클수록 우선순위가 높다는 의미 
- 필수(1000) , 높음(750) , 중간(500) , 낮음(250)  사용 권장

#### ✅ priority 설정 이유 ?
- 스크롤뷰의 크기는 혼자 스크롤이 될 크기가 얼마가 될지 알수 없음.
- 따라서 contentview 내부 크기에 따라 늘어날 수 있게 하는 설정 필요 !
- 즉, 상위 뷰인 contentview의 height 우선순위를 낮게하고 contentview안에 들어가는 다른 뷰들의 우선순위는 높게
- contentview 안에 들어가는 ui 요소들에 따라 contentview의 height가 늘어날 수 있도록!

### 🔮 마지막 요소에는 Bottom constraint 추가 !!
- 스크롤뷰는 스스로 스크롤이 될 크기를 아지 못하기 때문에 추정할 수 있게 마지막 요소는 bottom에서 얼마나 떨어져 있는지 명시 
