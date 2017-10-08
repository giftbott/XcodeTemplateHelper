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
}

final class ___VARIABLE_viperModuleName___ViewController: UIViewController {
  var presenter: ___VARIABLE_viperModuleName___PresenterProtocol!

  // View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewDidLoad()
  }
}

// MARK: - ViewProtocol

extension ___VARIABLE_viperModuleName___ViewController: ___VARIABLE_viperModuleName___ViewProtocol {

}
