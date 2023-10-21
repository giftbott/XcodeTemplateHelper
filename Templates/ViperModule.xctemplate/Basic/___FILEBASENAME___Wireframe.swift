//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_viperModuleName___WireframeProtocol: class {
  // Presenter -> Wireframe
}

// MARK: - Class Implementation

final class ___VARIABLE_viperModuleName___Wireframe: ___VARIABLE_viperModuleName___WireframeProtocol {
  weak var view: UIViewController!
  
  // MARK: Initializing
  
  static func createModule() -> ___VARIABLE_viperModuleName___ViewController {
    let view = ___VARIABLE_viperModuleName___ViewController()
    let wireframe = ___VARIABLE_viperModuleName___Wireframe()
    let presenter = ___VARIABLE_viperModuleName___Presenter()
    
    view.presenter = presenter
    wireframe.view = view
    presenter.view = view
    presenter.wireframe = wireframe
    return view
  }
  
  // MARK: Navigation
 
  
}
