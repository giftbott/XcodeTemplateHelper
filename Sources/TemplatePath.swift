import Foundation

enum TemplatePath: String {
  // Custom Template Path
  case customFile = "/Library/Developer/Xcode/Templates/File Templates/Custom/"
  case customProject = "/Library/Developer/Xcode/Templates/Project Templates/Custom/"

  // iOS Platform Path
  case xcodeFile = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Source/"
  case xcodeProject = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application/"
  
  // Xcode Base Template Path
  case xcodeBaseFile = "/Library/Xcode/Templates/File Templates/MultiPlatform/Source/"
}

