//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_viperModuleName___ViewProtocol: class {
  // Presenter -> View
  // <#Protocols#>
}

// MARK: - Class Implementation

final class ___VARIABLE_viperModuleName___ViewController: UIViewController {
  
  // MARK: Properties
  
  var presenter: ___VARIABLE_viperModuleName___PresenterProtocol!
  // <#Properties#>
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewDidLoad()
  }
  
  // MARK:
  
}

// MARK: - ViewProtocol

extension ___VARIABLE_viperModuleName___ViewController: ___VARIABLE_viperModuleName___ViewProtocol {

}
