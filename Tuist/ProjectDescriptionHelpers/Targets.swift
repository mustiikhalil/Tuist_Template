import ProjectDescription

public enum Targets: CaseIterable {
  case Kit, UI

  public var name: String {
    switch self {
    case .Kit:
      "Kit"
    case .UI:
      "UI"
    }
  }

  public var path: Path {
    Path("Modules/\(name)")
  }
}
