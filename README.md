
#  IOS Unit Testing by Example 도서 학습


## AssertYourself 1장 진도 완료(2023.02.02)
- 조건문은 가급적 피할 것
- 파라미터 x, 리턴 x
- 다른 사람이 테스트 코드를 보고 바로 이해할 수 있도록 직관적으로 작성할 것
- private 하지 않다
- 자주 쓰는 테스트 코드는 XCTAssertEqual(_:_:), XCTAssertEqual(_:_:accuracy:), XCTAssertNil(_:), ,XCTAssertNotNil(_:), XCTAssertTrue(_:), XCTAssertFalse(_:) XCTFail() 등이 있다
 
## LifeCycle 2장 진도 완료(2023.02.03)
- 인스턴스 초기화/호출/결과확인/인스턴스 소멸을 위해서는 setUp() tearDown()을 오버라이딩 해야한다
- 남용은 금물 
- Arrange, Act, Assert 개념을 파악할 것

## CodeCoverage 3장 진도 완료(2023.02.04)
- CodeCoveraged 적용 범위 파악
- 루프문을 테스트 할 땐 루프가 0회의 테스트도 필요하다
- if 문의 테스트는 참과 거짓 모두의 테스트가 필요하다
- EditScema -> Test -> Options -> Code Coverage [] Gather coverage for [all target] 부분을 체크한 후 커버리지 비율을 확인 할 수 있다 파란불은 활성화 빨간불은 비활성화   

## Take Control of Application Launch 4장 진도 완료(2023.02.05)
- 테스를 작성할 때 불필요하게 앱이 실행하는 과정에서 network 통신이 발생하개 되는데 이를 방지하기 위해서 커스텀 Launch를 만드는 내용
- Coverage를 측정해보니 앱 생성시 존재하는 AppDelegate가 0%로 미사용 됨

## Load View Controllers 5장 진도 완료(2023.02.05)
- ViewController Test시 xib, code, storyboard 모두 테스트 가능하다
- 그냥 초기화만 하면 테스트가 어렵고 3가지 전부  [ UIViewController ].loadViewIfNeeded() 를 호출 하면 view가 그려져 테스트가 가능해진다
