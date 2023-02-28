
#  IOS Unit Testing by Example 도서 학습

## 계획
1. 일단 진도만 나가기 모르면 대충 해보고 담장으로 ㄱㄱ
2. 진도 다 하면 다시 첨부터 해보고 다시 보기
3. 장 마지막마다 적혀있던 Activities를 수행해보기
4. 실제 내가 커스텀으로 제작해보기

# Part 1

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

## Manage Difficult Dependencies 6장 진도 완료(2023.02.13)
- FIRE 규칙을 사용하여 종속성이 빠르고 격리되고 반복 가능한지 테스트하기 쉬운지 여부
- 생성자를 통한 DI 주입, 프로퍼티를 통한 DI 주입 등을 활용할 것
- 싱긑턴 백도어? 모르는 단어는 따로 공부할 것


# Part 2

## Testing Outlet Connections 7장 진도 완료 (2023.02.16) 완료
- UI의 outlet 연결 확인 시 private(set)인 경우 notnil 검사에서 false가 나온다
 
## Testing Button Taps(Using Actions) 8장 진도 완료
- tap 함수를 따로 만들어서 UIAction을 테스트 하는게 훨씬 더 빠르다

## Testing Alerts 9장 진도완료
- 갑자기 프레임워크 출현해서 Test에 Phase
- 어렵다, 무슨 말인지 모르겠지만 그냥 했다

## Testing Navigation Between Screens 10장 진도 완료
- 화면 이동 테스트인데 너무 졸려서 진도만 쓱쓱 나갔다 ㅠㅠ

## Testing UserDefaults (with Fakes) 11장 진도 완료
- UserDefaults에 UserDefaultsProtocol라는 protocol을 만들어서 적용시키면 변수를 초기화 할 때 어노테이션, 타입 부분에 UserDefaultsProtocol을 선언하면 놀랍게도 컴파일 에러가 뜨지 않는다!
- 일종의 훼이크(Fake), Mock 개념이 여기서부터 본격적으로 나온다 

## Testing Network Request (with Mocks) 12장 진도완료
- UserDefaults와 마찬가지로 Dummy, Fake를 만들어서 예상, 결과를 확인하는 것인가보다

## Testing Network Responses (and Closures) 13장 진도완료
- 엄청 어렵고, 양이 많았다
- 비동기테스트는 일반적으로쓰이는 async, DispatchQueue는 test시 무조건 false가 반환하기 떄문에 XCTest에서 지원해주는  expectation(description: String)을 사용해서 테스트 한다 또한 completionHandler 클로져안에서 초기화한 expectation.fulfill() 을 작성해주면 비동기 값을 반환받을 수 있다
- 비동기 테스트에는 반환 대기 시간을 정할 수 있는데 책에서는 0.01초로 기준을 두라고 써있었다
- 반대로 비동기가 아닌 상태 또한 테스트가 가능하다 버튼을 눌러 네트워크 요정이 완료되기전에 button enable상태를 확인한다던가 등등
- 이 부분이 가장 핵심 과제인 것 같았따

## Testing Text Fields (and Delegate Methods) 14장 진도 완료
- 그나마 쉬웠다
- delegate함수를 테스트할려면 아예 통쨰로 만들어서 값을 넘겨서 호출하면 된다
- UI atributes상태 또한 체크가능
- isResponder까지 가능

## Testing Table Views 15장 진도 완료
- TestHelper 파일에 delegate 함수를 제작하여 임의로 값을 넣어 실행하면 실제 실행한 것과 같은 이벤트를 발생시킬 수 있고 이를 통하여 테스트를 진행할 수 있다
- 특정 indexPath.row 까지 가능할 줄은....신기방기

## Testing View Appearance (with Snapshots)
- snapshot 테스트를 하는건데 이해가 어렵다 프레임워크 연결까지만 성공...
