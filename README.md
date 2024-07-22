# iOS-Temp


###  Author

|<img src="https://avatars.githubusercontent.com/u/114010099?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/126383419?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/127755029?v=4" width="150" height="150"/>|
|:-:|:-:|:-:|
|**iOS Developer**<br/>송지혁<br/>[00306](https://github.com/00306)|**Product Designer**<br/>박민교<br/>[SONIA](https://github.com/sonia-nines)|**iOS Developer**<br/>장수민<br/>[suminjang](https://github.com/sumintnals)|


<br />


### 🛠️ Development Environment
<div>
<img src="https://img.shields.io/badge/17+-555555?style=for-the-badge&logo=ios&logoColor=white">
<img src="https://img.shields.io/badge/Swift 5.7-F05138?style=for-the-badge&logo=swift&logoColor=white">
<img src="https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=Xcode&logoColor=white">
<img src="https://img.shields.io/badge/SPM-000000?style=for-the-badge&logo=swift&logoColor=white">
  
</div>


<br />



### ✨ Tech Stack
* SwiftUI
* Combine
* SwiftData
* Push Notification
* Assistant API


<br />


### 🏛️ Architecture

 **MVVM + Clean Architecture**

![CleanArchitecture](https://github.com/user-attachments/assets/01158f28-f8c4-4128-a386-5f3c6d781d4d)


<br />




### 📌 Git Convention & Strategy
**Git Strategy**

![스크린샷 2024-07-11 오후 9 53 16](https://github.com/Hamstar-SeSACTHON/iOS-Temp/assets/114010099/6cc2d8eb-fe5a-43a0-9c2b-8b32ab742c9d)


`main` : 개발이 완료된 산출물이 저장될 공간

`develop` : feature 브랜치에서 구현된 기능들이 merge될 브랜치

`feature` : 기능을 개발하는 브랜치, 이슈별/작업별로 브랜치를 생성하여 기능을 개발한다

`release` : 릴리즈를 준비하는 브랜치, 릴리즈 직전 QA 기간에 사용한다

`hotfix` : 버그를 수정하는 브랜치

<br />

**Git Convention**

* **이슈**
  1. 이슈를 등록할 때 맨 앞에 이슈 종류 쓰기 (예: feat: 홈 UI 구현)
  2. 템플릿 사용
  3. 이슈에 맞는 label 달기

  ex) 이슈 템플릿
```## Description
설명을 작성하세요.

## To-do
- [ ] todo
- [ ] todo
```

<br />

* **브랜치**
  
브랜치명 = #이슈 번호/작업할 내용

ex) `#3/HomeViewUI`

<br />

* **커밋**
  
커밋 메시지 앞에 이슈: 넣기

ex) `feat: 홈 UI 구현`

<br />

* **태그**
  
`hotfix` : issue나, QA에서 급한 버그 수정에 사용

`fix` : 버그, 오류 해결

`add` : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시

`style` : 코드 포맷팅, 코드 변경이 없는 경우

`feat` : 새로운 기능 구현

`del` : 쓸모없는 코드 삭제

`docs` : README나 WIKI 등의 문서 개정

`chore` : 코드 수정, 내부 파일 수정, 빌드 업무 수정, 패키지 매니저 수정

`move` : 프로젝트 내 파일이나 코드의 이동

`rename` : 파일 이름 변경이 있을 때 사용합니다.

`refactor` : 전면 수정이 있을 때 사용합니다



### Code Convention
**swift-style-guide**
Hamstar iOS 멤버들은 아래 swift code convention을 참고해 코드를 작성한다.

- [Google Swift Style Guide](https://google.github.io/swift/)
- [Airbnb Swift Style Guide](https://github.com/airbnb/swift)
- [Linkedin Swift Style Guide](https://github.com/linkedin/swift-style-guide)
- [Raywenderlich Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)
- [StyleShare Swift Style Guide](https://github.com/StyleShare/swift-style-guide#%EC%B5%9C%EB%8C%80-%EC%A4%84-%EA%B8%B8%EC%9D%B4)
- [Channel Talk Swift Code Convention Guide](https://github.com/channel-io/ios-convention-guide)
