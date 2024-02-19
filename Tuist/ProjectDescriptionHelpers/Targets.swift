import ProjectDescription

public enum Targets: String, CaseIterable {

  public static let name = "App"

  case userInterface = "UserInterface", core = "Core"

  public var name: String {
    rawValue
  }

  public var path: Path {
    Path("Modules/\(name)")
  }
}
