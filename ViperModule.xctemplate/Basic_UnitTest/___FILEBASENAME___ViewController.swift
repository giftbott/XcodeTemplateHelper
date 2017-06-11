//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController {
  var presenter: ___FILEBASENAMEASIDENTIFIER___PresenterProtocol!

  // View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewDidLoad()
  }
}

//MARK: ViewProtocol
extension ___FILEBASENAMEASIDENTIFIER___ViewController: ___FILEBASENAMEASIDENTIFIER___ViewProtocol {

}
