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

final class ___VARIABLE_viperModuleName___Wireframe {
  weak var view: ___VARIABLE_viperModuleName___ViewController!
  
  static func createModule() -> ___VARIABLE_viperModuleName___ViewController {
    let view = ___VARIABLE_viperModuleName___ViewController()
    let wireframe = ___VARIABLE_viperModuleName___Wireframe()
    let presenter = ___VARIABLE_viperModuleName___Presenter(view: view, wireframe: wireframe)
    
    view.presenter = presenter
    wireframe.view = view
    
    return view
  }
}

// MARK: - WireframeProtocol

extension ___VARIABLE_viperModuleName___Wireframe: ___VARIABLE_viperModuleName___WireframeProtocol {
  
}
