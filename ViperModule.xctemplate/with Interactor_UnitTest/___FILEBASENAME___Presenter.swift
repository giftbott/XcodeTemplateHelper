//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class ___FILEBASENAMEASIDENTIFIER___Presenter {
  // Default
  weak var view: ___FILEBASENAMEASIDENTIFIER___ViewProtocol?
  let wireframe: ___FILEBASENAMEASIDENTIFIER___WireframeProtocol
  let interactor: ___FILEBASENAMEASIDENTIFIER___InteractorInputProtocol

  init(wireframe: ___FILEBASENAMEASIDENTIFIER___WireframeProtocol,
       interactor: ___FILEBASENAMEASIDENTIFIER___InteractorInputProtocol) {
      self.wireframe = wireframe
      self.interactor = interactor
  }

  //
  
}

extension ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___PresenterProtocol {
  func onViewDidLoad() {

  }
}

extension ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___InteractorOutputProtocol {

}