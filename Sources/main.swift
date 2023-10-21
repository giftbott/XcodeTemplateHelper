import Foundation

let sessionUserName = bash(command: "who", arguments: ["am", "i"]).components(separatedBy: " ").first!
let currentUserName = bash(command: "whoami", arguments: [])   // could be root
let fileManager = FileManager.default

@discardableResult
func bash(command: String, arguments: [String]) -> String {
  let commandPath = shell(launchPath: "/bin/zsh", arguments: ["-c", "which \(command)" ])
  return shell(launchPath: commandPath, arguments: arguments)
}

private func shell(launchPath: String, arguments: [String]) -> String {
  let task = Process()
  task.launchPath = launchPath
  task.arguments = arguments

  let pipe = Pipe()
  task.standardOutput = pipe
  task.standardError = pipe
  task.launch()

  let data = pipe.fileHandleForReading.readDataToEndOfFile()
  guard let output = String(data: data, encoding: String.Encoding.utf8) else {
    fatalError("Failed to convert command output to string")
  }

  return output.trimmingCharacters(in: .newlines)
}

private func main() {
  let arguments = CommandLine.arguments
  let argc = CommandLine.argc
  
  switch argc {
  case 1:
    installTemplateSetup()
  case 2:
    if ["-i", "--install"].contains(arguments[1]) {
      installTemplateSetup()
    } else if ["-r", "--remove"].contains(arguments[1]) {
      removeTemplateSetup()
    } else {
      showToolInstructions()
    }
  case 3:
    guard ["-g", "--get"].contains(arguments[1]),
          ["file", "project"].contains(arguments[2])
    else { return showToolInstructions() }

    guard currentUserName == "root" else {
      return authorityAlert(needSudo: true)
    }

    let type: TemplateType = arguments[2] == "file" ? .file : .project
    getBaseTemplate(type: type)
  default:
    showToolInstructions()
  }
}

main()
