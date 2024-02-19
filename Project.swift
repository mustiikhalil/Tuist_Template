import ProjectDescription
import ProjectDescriptionHelpers

let destinations: Destinations = [.iPhone, .mac]
let name = "App"

let targets: [Target] = {
  var targets: [Target] = [
    .core,
    .coreTests,
    .userInterface,
    .userInterfaceTests,
  ]
  targets.append(
    contentsOf: Target.app(
      name: name,
      destinations: destinations,
      additionalTargets: [.core, .userInterface]
    )
  )
  return targets
}()

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project(
  name: "\(Targets.name)",
  organizationName: "example.com",
  options: .options(
    automaticSchemesOptions: .enabled(
      codeCoverageEnabled: true,
      testingOptions: [.parallelizable, .randomExecutionOrdering]
    )
  ),
  targets: targets
)
