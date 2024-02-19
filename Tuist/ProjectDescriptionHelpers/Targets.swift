import ProjectDescription

public enum Targets: String, CaseIterable {

  public static let name = "name"

  case userInterface = "UserInterface", core = "Core"

  public var name: String {
    self.rawValue
  }

  public var path: Path {
    Path("Modules/\(name)")
  }
}
