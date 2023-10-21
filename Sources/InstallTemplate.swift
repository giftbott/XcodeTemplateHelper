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
    .contentsOfDirectory(atPath: "Templates")
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

func makeTargetPath() -> String {
  // Select Target Base Path
  let userHomeDir = "/Users/".appending(sessionUserName)
  let xcodeBasePath = bash(command: "xcode-select", arguments: ["--print-path"])

  // Default Path (Custom File Template)
  var basePath = userHomeDir
  var templatePath = TemplatePath.customFile.rawValue

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
        exit(-1)
      }
      basePath = xcodeBasePath
      templatePath = TemplatePath.xcodeFile.rawValue
    case 4:
      guard currentUserName == "root" else {
        authorityAlert(needSudo: true)
        exit(-1)
      }
      basePath = xcodeBasePath
      templatePath = TemplatePath.xcodeProject.rawValue
    default:
      break
    }

    break
  }

  let targetPath = basePath.appending(templatePath)
  printProcess("Template will be installed at \(targetPath)")
  bash(command: "mkdir", arguments: ["-p", targetPath])

  return targetPath
}

/// Copy template to selected target path
func install(template templateName: String) {
  listTemplateOptions()

  let originPath = "./templates/"
  let originTemplate = originPath + templateName
  let targetPath = makeTargetPath()
  let targetLocation = targetPath + templateName
  let isSuccess = copyTemplate(from: originTemplate, to: targetLocation)

  if isSuccess, targetPath.hasPrefix("/Users"), currentUserName == "root" {
    changeOwner(of: targetPath)

    //let templateFiles = try? fileManager.contentsOfDirectory(atPath: targetPath)
    //guard let files = templateFiles else { return }

    //for file in files {
      //changeOwner(of: targetPath + "/\(file)")
    //}
  }
}

