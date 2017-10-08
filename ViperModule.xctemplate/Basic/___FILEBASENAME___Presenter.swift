//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol ___VARIABLE_viperModuleName___PresenterProtocol: class {
  // View -> Presenter
  func onViewDidLoad()
}

final class ___VARIABLE_viperModuleName___Presenter {
  weak var view: ___VARIABLE_viperModuleName___ViewProtocol!
  let wireframe: ___VARIABLE_viperModuleName___WireframeProtocol
  
  init(view: ___VARIABLE_viperModuleName___ViewProtocol,
       wireframe: ___VARIABLE_viperModuleName___WireframeProtocol) {
    self.view = view
    self.wireframe = wireframe
  }
}

// MARK: - PresenterProtocol

extension ___VARIABLE_viperModuleName___Presenter: ___VARIABLE_viperModuleName___PresenterProtocol {
  func onViewDidLoad() {
    
  }
}
