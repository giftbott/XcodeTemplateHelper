//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_MVPModuleName___ViewType: ViewType {
//  <#Protocols#>
}

// MARK: - Class Implementation

final class ___VARIABLE_MVPModuleName___ViewController: BaseViewController {
  
  // MARK: Properties
  
  let presenter: ___VARIABLE_MVPModuleName___PresenterType
//  <#Properties#>

  // MARK: Initializing
  
  init(presenter: ___VARIABLE_MVPModuleName___PresenterType) {
    self.presenter = presenter
    super.init()
    presenter.view = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: Setup UI
  
  override func setupUI() {
  //  <#Code#>
  }
  
  override func setupConstraints() {
  //  <#Code#>
  }
  
  // MARK:

}

// MARK: - ___VARIABLE_MVPModuleName___ViewType

extension ___VARIABLE_MVPModuleName___ViewController: ___VARIABLE_MVPModuleName___ViewType {
//  <#Code#>
}

