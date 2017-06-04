//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___Wireframe: ___FILEBASENAMEASIDENTIFIER___WireframeProtocol {
  weak var view: UIViewController?
    
  static func createModule() -> UIViewController {
    let wireframe = ___FILEBASENAMEASIDENTIFIER___Wireframe()
    let dataManager = ___FILEBASENAMEASIDENTIFIER___DataManager()
    let interactor = ___FILEBASENAMEASIDENTIFIER___Interactor(dataManager: dataManager)
    let presenter = ___FILEBASENAMEASIDENTIFIER___Presenter(wireframe: wireframe, interactor: interactor)
    let view = ___FILEBASENAMEASIDENTIFIER___ViewController(presenter: presenter)
        
    presenter.view = view
    interactor.presenter = presenter
    dataManager.requestHandler = interactor
        
    return view
  }
}
