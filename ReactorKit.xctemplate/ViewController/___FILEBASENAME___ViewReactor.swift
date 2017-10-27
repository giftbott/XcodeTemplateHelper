//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

final class ___VARIABLE_reactorKitModuleName___ViewReactor: Reactor {
  enum Action {
//    case <#actionCase#>
  }
  
  enum Mutation {
//    case <#mutationCase#>
  }
  
  struct State {
//    <#stateProperty#>
  }
  
  let initialState: State
  
  init() {
    initialState = State()
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
//    case .<#actionCase#>:
    }
  }
  
  // MARK: Reduce
  
  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
//    case .<#mutationCase#>:
    }
  }
}
