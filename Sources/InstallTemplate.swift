//
//  installTemplate.swift
//  Install Template
//
//  Created by giftbott on 04/06/2017.
//  Copyright © 2017 giftbott. All rights reserved.
//

import Foundation

/// Should select template only if more than one
func installTemplateSetup() {
  let templateChecker = try? fileManager
    .contentsOfDirectory(atPath: "./")
    .filter { $0.hasSuffix(".xctemplate") }
  
  guard let templates = templateChecker, !templates.isEmpty else {
    printProcess("xctemplate does not exist")
    return
  }
  
  guard templates.count > 1 else {
    install(template: templates[0])
    return
  }
  
  // Show xctemplates in current directory
  print("Select Template")
  print(String(repeating: "#", count:30))
  print(templates.enumerated().map { String(describing: "\($0 + 1): \($1)") }.joined(separator: "\n"))
  print(String(repeating: "#", count:30), terminator: "\n\n")
  
  while true {
    print("Select template number (q: quit): ", terminator: "")
    let input = readLine() ?? "1"

    guard input.lowercased() != "q" else { exit(0) }
    guard let num = Int(input), num >= 1, num <= templates.count else {
      print("Wrong Value\n")
      continue
    }
    
    let templateName = templates[num - 1]
    printProcess("\(templateName) is selected\n")
    
    install(template: templateName)
    break
  }
}

/// Copy template to selected target path
func install(template templateName: String) {
  listTemplateOptions()

  // Select Target Base Path
  let userHomeDirectory = "/Users/".appending(sessionUserName)
  let xcodeBasePath = bash(command: "xcode-select", arguments: ["--print-path"])
  
  // Default Path (Custom File Template)
  var basePath = userHomeDirectory
  var templatePath = TemplatePath.customFile.rawValue

  // 
  while true {
    print("Input Target Number (q: quit): ", terminator: "")
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
  printProcess("Template will be installed at \(directoryPath)")
  _ = bash(command: "mkdir", arguments: ["-p", directoryPath])
  
  let fullPath = directoryPath.appending(templateName)

  let isSuccess = copyTemplate(from: templateName, to: fullPath)
  if isSuccess, basePath == userHomeDirectory, currentUserName == "root" {
    changeOwner(of: fullPath)

    let templateFiles = try? fileManager.contentsOfDirectory(atPath: fullPath)
    guard let files = templateFiles else { return }

    for file in files {
      changeOwner(of: fullPath + "/\(file)")
    }
  }
}

