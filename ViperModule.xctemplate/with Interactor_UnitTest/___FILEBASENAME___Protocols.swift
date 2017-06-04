//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: View
protocol ___FILEBASENAMEASIDENTIFIER___ViewProtocol: class {

  // Presenter -> View
}


//MARK: Wireframe
protocol ___FILEBASENAMEASIDENTIFIER___WireframeProtocol: class {

  // Presenter -> Wireframe
}


//MARK: Presenter
protocol ___FILEBASENAMEASIDENTIFIER___PresenterProtocol: class {

  // View -> Presenter
  func onViewDidLoad()
}


//MARK: Interactor
protocol ___FILEBASENAMEASIDENTIFIER___InteractorInputProtocol: class {

  // Presenter -> Interactor
}

protocol ___FILEBASENAMEASIDENTIFIER___InteractorOutputProtocol: class {
  
  // Interactor -> Presenter
}
