//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ___FILEBASENAMEASIDENTIFIER___Wireframe {
  weak var view: ___FILEBASENAMEASIDENTIFIER___ViewController!
  
  static func createModule() -> ___FILEBASENAMEASIDENTIFIER___ViewController {
    let view = ___FILEBASENAMEASIDENTIFIER___ViewController()
    let wireframe = ___FILEBASENAMEASIDENTIFIER___Wireframe()
    let interactor = ___FILEBASENAMEASIDENTIFIER___Interactor()
    let presenter = ___FILEBASENAMEASIDENTIFIER___Presenter(view: view, wireframe: wireframe, interactor: interactor)
    
    view.presenter = presenter
    wireframe.view = view
    interactor.presenter = presenter
    
    return view
  }
}

//MARK: WireframeProtocol
extension ___FILEBASENAMEASIDENTIFIER___Wireframe: ___FILEBASENAMEASIDENTIFIER___WireframeProtocol {
}
