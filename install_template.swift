//
//  install_template.swift
//  Install Template
//
//  Created by giftbott on 04/06/2017.
//  Copyright © 2017 giftbott. All rights reserved.
//

import Foundation

// ==========================
// MARK: - Bash Shell Command
// ==========================
func bash(command: String, arguments: [String]) -> String {
  let commandPath = shell(launchPath: "/bin/bash", arguments: ["-c", "which \(command)" ])
  return shell(launchPath: commandPath, arguments: arguments)
}

func shell(launchPath: String, arguments: [String]) -> String {
  let task = Process()
  task.launchPath = launchPath
  task.arguments = arguments
  
  let pipe = Pipe()
  task.standardOutput = pipe
  task.launch()
  
  let data = pipe.fileHandleForReading.readDataToEndOfFile()
  let output = String(data: data, encoding: String.Encoding.utf8)!
  
  return output.trimmingCharacters(in: .newlines)
}

// ========================
// MARK: - Install template
// ========================

// UserName (currentUserName could be root)
let sessionUserName = bash(command: "who", arguments: ["am", "i"]).components(separatedBy: " ").first!
let currentUserName = bash(command: "whoami", arguments: [])

let fileManager = FileManager.default

/// Should select template only if more than one
func setup() {
  let templateChecker = try? fileManager
    .contentsOfDirectory(atPath: ".")
    .filter { $0.hasSuffix(".xctemplate") }
  
  guard let templates = templateChecker, !templates.isEmpty else {
    printProcess("xctemplate directory does not exist")
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
    print("Select template number : ", terminator: "")
    let input = readLine() ?? "1"
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
  // Print Choiceable Target Directory Path
  printPathOptions()
  
  // Select Target Base Path
  let userHomeDirectory = "/Users/".appending(sessionUserName)
  let xcodeBasePath = bash(command: "xcode-select", arguments: ["--print-path"])
  
  // Default Path (Custom File Template)
  var basePath = userHomeDirectory
  var pathEndPoint = PathEndPoint.customFileTemplate.rawValue
  
  // 
  while true {
    print("Select Target Path Number : ", terminator: "")
    let input = readLine() ?? "1"
    guard let num = Int(input), num >= 1, num <= 4 else {
      print("Wrong Value\n")
      continue
    }
    
    switch num {
    case 1:
      break
    case 2:
      pathEndPoint = PathEndPoint.customProjectTemplate.rawValue
    case 3:
      guard currentUserName == "root" else {
        authorityAlert(needSudo: true)
        return
      }
      basePath = xcodeBasePath
      pathEndPoint = PathEndPoint.xcodeFileTemplate.rawValue
    case 4:
      guard currentUserName == "root" else {
        authorityAlert(needSudo: true)
        return
      }
      basePath = xcodeBasePath
      pathEndPoint = PathEndPoint.xcodeProjectTemplate.rawValue
    default:
      break
    }
    
    break
  }
  
  let directoryPath = basePath.appending(pathEndPoint)
  printProcess("Template will be installed at \(directoryPath)")
  _ = bash(command: "mkdir", arguments: ["-p", directoryPath])
  
  let fullPath = directoryPath.appending("/\(templateName)")
  
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

/// Try copy
func copyTemplate(from: String, to: String) -> Bool {
  do {
    printProcess(".....")
    defer { print() }
    
    if !fileManager.fileExists(atPath: to) {
      try fileManager.copyItem(atPath: from, toPath: to)
      
      printProcess("Template installed succesfully.")
    } else {
      try _ = fileManager.removeItem(atPath: to)
      try fileManager.copyItem(atPath: from, toPath: to)
      
      printProcess("Template has been replaced succesfully.")
    }

    return true
  } catch let error as NSError {
    printProcess("Ooops! Something went wrong: \(error.localizedFailureReason!)")
    return false
  }
}

// MARK: - GetBaseTemplate
enum TemplateType {
  case file
  case project
}

/// Copy from Xcode Template (File: Swift, Project: Single View Application)
func getBaseTemplate(type: TemplateType) {
  let xcodeBasePath = bash(command: "xcode-select", arguments: ["--print-path"])
  switch type {
  case .file:
    printProcess("Now Copy File Template")
    let originPath = xcodeBasePath + "/Library/Xcode/Templates/File Templates/Source/"
    let templateName = "Swift File.xctemplate"
    let newPath = "./BaseFileTemplate.xctemplate"
    
    guard copyTemplate(from: originPath + templateName, to: newPath) else { return }
    changeOwner(of: newPath)
  case .project:
    printProcess("Now Copy Project Template")
    let originPath = xcodeBasePath + "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application/"
    let templateName = "Single View Application.xctemplate"
    let newPath = "./BaseProjectTemplate.xctemplate"
    
    guard copyTemplate(from: originPath + templateName, to: newPath) else { return }
    changeOwner(of: newPath)
  }
}

/// Need to change owner after using sudo command, root -> sessionUserName
func changeOwner(of path: String) {
  _ = bash(command: "chown", arguments: [sessionUserName, path])
}

// MARK: - Helper
func printProcess(_ message: String) {
  print(">>>>", message)
}

func printPathOptions() {
  print("Select Directory Path to Install Template")
  print(String(repeating: "#", count:40))
  print("1: Custom File Template")
  print("2: Custom Project Template")
  print("3: Xcode File Template (admin only)")
  print("4: Xcode Project Template (admin only)")
  print(String(repeating: "#", count:40), terminator: "\n\n")
}

func authorityAlert(needSudo: Bool) {
  if needSudo {
    print("It needs to be executed with sudo command\n")
  } else {
    print("CustomTemplate must be executed without sudo command\n")
  }
}

func argumentsAlert() {
  print("Illegal option.")
  print("usage : swift install_template.swift [-g file / -g project]\n")
}

// MARK: Template Target Path
enum PathEndPoint: String {
  case customFileTemplate = "/Library/Developer/Xcode/Templates/File Templates/Custom"
  case customProjectTemplate = "/Library/Developer/Xcode/Templates/Project Templates/Custom"
  //iOS Platform Path
  case xcodeFileTemplate = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Source"
  case xcodeProjectTemplate = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"
}

// ===============
// MARK: - Execute
// ===============

let arguments = CommandLine.arguments

switch CommandLine.argc {
case 1:
  setup()
case 3:
  let type = arguments[2]
  guard arguments[1] == "-g", (type == "file" || type == "project") else {
    argumentsAlert()
    break
  }

  guard currentUserName == "root" else {
    authorityAlert(needSudo: true)
    break
  }

  if type == "file" {
    getBaseTemplate(type: .file)
  } else if type == "project" {
    getBaseTemplate(type: .project)
  }
default:
  argumentsAlert()
}
