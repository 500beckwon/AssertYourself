
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
