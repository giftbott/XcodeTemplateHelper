import Foundation

func printProcess(_ message: String) {
  print(">>>>", message)
}

func listTemplateOptions() {
  print("Select the type of template to control")
  print(String(repeating: "#", count:40))
  print("1: Custom File Template")
  print("2: Custom Project Template")
  print("3: Xcode File Template (Required root)")
  print("4: Xcode Project Template (Required root)")
  print(String(repeating: "#", count:40), terminator: "\n\n")
}

func authorityAlert(needSudo: Bool) {
  if needSudo {
    print("Should be executed with sudo command\n")
  } else {
    print("CustomTemplate must be executed without sudo command\n")
  }
}

func showToolInstructions() {
  print("Usage:")
  print("./template_helper")
  print("./template_helper -r(= --remove)")
  print("./template_helper -g(= --get) [file/project]")
}


func copyTemplate(from originPath: String, to targetPath: String) -> Bool {
  do {
    printProcess(".....")
    defer { print() }

    if !fileManager.fileExists(atPath: targetPath) {
      try fileManager.copyItem(atPath: originPath, toPath: targetPath)

      printProcess("Template installed successfully.")
    } else {
      try fileManager.removeItem(atPath: targetPath)
      try fileManager.copyItem(atPath: originPath, toPath: targetPath)

      printProcess("Template has been replaced successfully.")
    }

    return true
  } catch let error as NSError {
    printProcess("Ooops! Something went wrong: \(error.localizedFailureReason!)")
    return false
  }
}

func changeOwner(of path: String) {
  bash(command: "chown", arguments: ["-R", sessionUserName, path])
}

