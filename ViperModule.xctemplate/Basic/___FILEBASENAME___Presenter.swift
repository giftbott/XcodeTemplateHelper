//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ___FILEBASENAMEASIDENTIFIER___Presenter {
  weak var view: ___FILEBASENAMEASIDENTIFIER___ViewProtocol!
  let wireframe: ___FILEBASENAMEASIDENTIFIER___WireframeProtocol
  
  init(view: ___FILEBASENAMEASIDENTIFIER___ViewProtocol,
       wireframe: ___FILEBASENAMEASIDENTIFIER___WireframeProtocol) {
    self.view = view
    self.wireframe = wireframe
  }
}

//MARK: PresenterProtocol
extension ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___PresenterProtocol {
  func onViewDidLoad() {
    
  }
}
