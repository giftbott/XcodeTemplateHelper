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
// MARK: - Remove template
// ========================

// UserName (currentUserName could be root)
let sessionUserName = bash(command: "who", arguments: ["am", "i"]).components(separatedBy: " ").first!
let currentUserName = bash(command: "whoami", arguments: [])

let fileManager = FileManager.default

/// Should select template only if more than one
func setup() {
  printPathOptions()
  
  // Select Target Base Path
  let userHomeDirectory = "/Users/".appending(sessionUserName)
  let xcodeBasePath = bash(command: "xcode-select", arguments: ["--print-path"])
  
  // Default Path (Custom File Template)
  var basePath = userHomeDirectory
  var pathEndPoint = PathEndPoint.customFileTemplate.rawValue
  
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
      try _ = fileManager.removeItem(atPath: template)
      printProcess("Template has been removed successfully")
    } else {
      printProcess("Custom template does not exist")
    }
  } catch let error as NSError {
    printProcess("Ooops! Something went wrong: \(error.localizedFailureReason!)")
    return 
  }
}

// MARK: - Helper
func printProcess(_ message: String) {
  print(">>>>", message)
}

func printPathOptions() {
  print("Select Path to Remove Template")
  print(String(repeating: "#", count:40))
  print("1: Custom File Template")
  print("2: Custom Project Template")
  print("3: Xcode File Template")
  print("4: Xcode Project Template")
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
  print("usage : swift remove_template.swift\n")
}

// MARK: Template Target Path
enum PathEndPoint: String {
  case customFileTemplate = "/Library/Developer/Xcode/Templates/File Templates/Custom/"
  case customProjectTemplate = "/Library/Developer/Xcode/Templates/Project Templates/Custom/"
  //iOS Platform Path
  case xcodeFileTemplate = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Source/"
  case xcodeProjectTemplate = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application/"
  //Xcode Base Template Path
  case xcodeBaseFileTemplate = "/Library/Xcode/Templates/File Templates/Source/"
}

// ===============
// MARK: - Execute
// ===============

let arguments = CommandLine.arguments

switch CommandLine.argc {
case 1:
  setup()
default:
  argumentsAlert()
}
