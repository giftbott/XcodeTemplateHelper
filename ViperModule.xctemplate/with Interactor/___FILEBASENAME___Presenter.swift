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

protocol ___VARIABLE_viperModuleName___InteractorOutputProtocol: class {
  // Interactor -> Presenter
}

final class ___VARIABLE_viperModuleName___Presenter {
  weak var view: ___VARIABLE_viperModuleName___ViewProtocol!
  let wireframe: ___VARIABLE_viperModuleName___WireframeProtocol
  let interactor: ___VARIABLE_viperModuleName___InteractorInputProtocol
  
  init(view: ___VARIABLE_viperModuleName___ViewProtocol,
       wireframe: ___VARIABLE_viperModuleName___WireframeProtocol,
       interactor: ___VARIABLE_viperModuleName___InteractorInputProtocol) {
    self.view = view
    self.wireframe = wireframe
    self.interactor = interactor
  }
}

// MARK: - PresenterProtocol
extension ___VARIABLE_viperModuleName___Presenter: ___VARIABLE_viperModuleName___PresenterProtocol {
  func onViewDidLoad() {
    
  }
}

// MARK: - InteractorOutputProtocol
extension ___VARIABLE_viperModuleName___Presenter: ___VARIABLE_viperModuleName___InteractorOutputProtocol {
  
}

