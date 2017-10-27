//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift

final class ___VARIABLE_reactorKitModuleName___ViewController: UIViewController, View {
  
  // MARK: Properties
  
  var disposeBag = DisposeBag()
//  <#Properties#>

  // MARK: Initializing
  
  init(reactor: ___VARIABLE_reactorKitModuleName___ViewReactor) {
    super.init(nibName: nil, bundle: nil)
    self.reactor = reactor
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: Binding
  
  func bind(reactor: ___VARIABLE_reactorKitModuleName___ViewReactor) {
    // Action
    
    // State
    
  }
}
