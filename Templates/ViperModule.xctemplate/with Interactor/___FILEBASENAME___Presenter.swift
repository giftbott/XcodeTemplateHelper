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
  // <#Protocols#>
}

protocol ___VARIABLE_viperModuleName___InteractorOutputProtocol: class {
  // Interactor -> Presenter
}

// MARK: - Class Implementation

final class ___VARIABLE_viperModuleName___Presenter {
  
  // MARK: Properties
  
  weak var view: ___VARIABLE_viperModuleName___ViewProtocol!
  var wireframe: ___VARIABLE_viperModuleName___WireframeProtocol!
  var interactor: ___VARIABLE_viperModuleName___InteractorInputProtocol!
  // <#Properties#>

  // MARK: Initializing
  
  init() {
    
  }
  
  // MARK:
  
}

// MARK: - PresenterProtocol

extension ___VARIABLE_viperModuleName___Presenter: ___VARIABLE_viperModuleName___PresenterProtocol {
  func onViewDidLoad() {
    
  }
}

// MARK: - InteractorOutputProtocol

extension ___VARIABLE_viperModuleName___Presenter: ___VARIABLE_viperModuleName___InteractorOutputProtocol {
  
}

