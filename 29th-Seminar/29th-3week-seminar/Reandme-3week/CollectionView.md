## 📌 CollectionView ? 
collection view도 table view와 비슷하게 scrollview를 상속받았고 delegate pattern을 이용해 구현 ! table view 사용법과 매우 비슷 ! 

✨ 기본설정
1. 가로 스크롤 구현 : Scroll Direction을 Horizontal 로 
2. Estimate Size는 `none`으로 ! 
  - `Estimate Size`를 지정하는 이유? 초기에 셀들의 위치를 임시배정하고 오토레이아웃 연산을 마치게 되면 그에 따라서 content size를 조절하게 되는데, cell의 오토레이아웃을 기반으로 셀의 사이즈가 조절되지 않고 개발자의 코드를 기반으로 레이아웃을 잡기 위해 `none`으로 지정 !
  - `UICollectionViewDelegateFlowLayout`을 채택하여 메소드를 구현하여 해당 cell의 사이즈를 동적으로 조절



