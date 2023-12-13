import ProjectDescription

public enum Targets: CaseIterable {

  public static let name = "name"

  case Kit, UI

  public var name: String {
    switch self {
    case .Kit:
      "\(Targets.name)Kit"
    case .UI:
      "\(Targets.name)UI"
    }
  }

  public var path: Path {
    Path("Modules/\(name)")
  }
}
