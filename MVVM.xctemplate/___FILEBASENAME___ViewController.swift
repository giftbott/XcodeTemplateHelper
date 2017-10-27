//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

final class ___VARIABLE_MVVMModuleName___ViewController: UIViewController, ViewType {
  
  // MARK: Properties
  
  let disposeBag = DisposeBag()
  let viewModel: ___VARIABLE_MVVMModuleName___ViewModelType
//  <#Properties#>

  // MARK: Initializing
  
  init(viewModel: ___VARIABLE_MVVMModuleName___ViewModelType) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: Setup UI
  
  func setupUI() {
    
  }
  
  // MARK: Rx Binding
  
  func setupBinding() {

  }
}
