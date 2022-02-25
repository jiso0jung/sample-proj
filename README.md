# README

Rspec 상에서 before_type_cast가 정상동작하지 않는 현상을 재현한 RoR 프로젝트 입니다.

### 환경
* ruby 3.1.0
* rails 7.0.2
* sqlite3 1.4
* rspec 4.0

### 재현 시나리오
* Rspec에서 연관관계 매핑을 통해 객체 리스트를 가져온다 
```ruby
chocolates = box.chocolates
```
* 메소드를 이용해 단일 객체에 접근한 후 before_type_cast 메소드를 호출한다 => 정상동작
```ruby
chocolates.first.flavor_before_type_cast
=> '녹차' # enum의 value를 출력
```
* 인덱스를 이용해 단일 객체에 접근한 후 before_type_cast 메소드를 호출한다 => 정상동작 x
```ruby
chocolates[0].flavor_before_type_cast
=> 'matcha' # enum의 key를 출력
```
* 다시 where구문으로 객체 리스트를 가져온다
```ruby
chocolates = Chocolate.where(box: box)
```
* 인덱스를 이용해 단일 객체에 접근한 후 before_type_cast 메소드를 호출한다 => 정상동작
```ruby
chocolate[0].flavor_before_type_cast
=> '녹차' 
```
### 재현 프로세스
* `bundle install`
* `rake db:migrate`
* `bundle exec rspec`

### 참고사항
* `each`, `map` 구문으로 단일객체에 접근했을 때도 이상현상이 재현된다.
* 일단은 rspec에서만 확인되는 현상이다. (rails 콘솔등을 통해 재현되지 않음)
* 환경에 따라 재현되지 않을수도 있다.
  
  (이 프로젝트에서도 원래 재현 안됐었는데 모델 이름과 enum 키/밸류값만 바꿔서 다시 만들었더니 재현됨)

### 코드 재현 파일 경로
* `spec/model/chocolates_spec.rb` 