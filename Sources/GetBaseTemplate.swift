import Foundation

/// Copy from Xcode Template 
/// File type: Swift
/// Project type: iOS SwiftUI App
func getBaseTemplate(type: TemplateType) {
  let (originPath, newPath) = configurePath(type)
  guard copyTemplate(from: originPath, to: newPath) else { return }

  // Change Owner of Directory
  changeOwner(of: newPath)

  // Change Owner of files
  let templateFiles = try? fileManager.contentsOfDirectory(atPath: newPath)
  guard let files = templateFiles else { return }
  for file in files {
    changeOwner(of: newPath + "/\(file)")
  }
}

func configurePath(_ type: TemplateType) -> (String, String) {
  let xcodeBasePath = bash(command: "xcode-select", arguments: ["--print-path"])

  switch type {
  case .file:
    printProcess("Now Copy File Template")
    let templatePath = xcodeBasePath + TemplatePath.xcodeBaseFile.rawValue + "Swift File.xctemplate"
    let copiedPath = "./BaseFileTemplate.xctemplate"
    return (templatePath, copiedPath)
  case .project:
    printProcess("Now Copy Project Template")
    let templatePath = xcodeBasePath + TemplatePath.xcodeProject.rawValue + "App.xctemplate"
    let copiedPath = "./BaseProjectTemplate.xctemplate"
    return (templatePath, copiedPath)
  }
}


