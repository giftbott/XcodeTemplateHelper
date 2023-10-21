//
//  install_template.swift
//  Install Template
//
//  Created by giftbott on 04/06/2017.
//  Copyright © 2017 giftbott. All rights reserved.
//

import Foundation

// MARK: - Remove template

/// Should select template only if more than one
func removeTemplateSetup() {
  listTemplateOptions()

  // Select Target Base Path
  let userHomeDirectory = "/Users/".appending(sessionUserName)
  let xcodeBasePath = bash(command: "xcode-select", arguments: ["--print-path"])
  
  // Default Path (Custom File Template)
  var basePath = userHomeDirectory
  var templatePath = TemplatePath.customFile.rawValue
  
  //
  while true {
    print("Input Target Number (q: quit) : ", terminator: "")
    let input = readLine() ?? "1"

    guard input.lowercased() != "q" else { exit(0) }
    guard let num = Int(input), num >= 1, num <= 4 else {
      print("Wrong Value\n")
      continue
    }
    
    switch num {
    case 2:
      templatePath = TemplatePath.customProject.rawValue
    case 3:
      guard currentUserName == "root" else {
        authorityAlert(needSudo: true)
        return
      }
      basePath = xcodeBasePath
      templatePath = TemplatePath.xcodeFile.rawValue
    case 4:
      guard currentUserName == "root" else {
        authorityAlert(needSudo: true)
        return
      }
      basePath = xcodeBasePath
      templatePath = TemplatePath.xcodeProject.rawValue
    default:
      break
    }
    
    break
  }
  
  let directoryPath = basePath.appending(templatePath)
  let templateChecker = try? fileManager
    .contentsOfDirectory(atPath: directoryPath)
    .filter { $0.hasSuffix(".xctemplate") }
    .filter { templateName in
      let attributes = try! fileManager.attributesOfItem(atPath: directoryPath + templateName)
      if  sessionUserName == attributes[FileAttributeKey.ownerAccountName] as! String {
        return true
      } else {
        return false
      }
  }
  
  guard let templates = templateChecker, !templates.isEmpty else {
    printProcess("Custom template does not exist")
    return
  }
  
  print("\n    Custom Template Lists")
  print(String(repeating: "#", count:30))
  print(templates.enumerated().map { String(describing: "\($0 + 1): \($1)") }.joined(separator: "\n"))
  print(String(repeating: "#", count:30), terminator: "\n\n")
  
  while true {
    print("Select template (Caution. Can't undo) (q: quit) : ", terminator: "")
    let input = readLine() ?? "1"

    guard input.lowercased() != "q" else { exit(0) }
    guard let num = Int(input), num >= 1, num <= templates.count else {
      print("Wrong Value\n")
      continue
    }
    
    let templateName = templates[num - 1]
    printProcess("\(templateName) is selected")
    remove(template: directoryPath + templateName)
    break
  }
}

func remove(template: String) {
  do {
    printProcess(".....")
    defer { print() }
    
    if fileManager.fileExists(atPath: template) {
      try fileManager.removeItem(atPath: template)
      printProcess("Template has been removed successfully")
    } else {
      printProcess("Custom template does not exist")
    }
  } catch let error as NSError {
    printProcess("Ooops! Something went wrong: \(error.localizedFailureReason!)")
    return 
  }
}

