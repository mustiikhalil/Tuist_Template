//
//  Target+Extensions.swift
//  ProjectDescriptionHelpers
//
//  Created by Mustafa Khalil on 2023-12-08.
//

import ProjectDescription

private extension DeploymentTargets {
  static var macOSAndiOS: DeploymentTargets {
    .multiplatform(iOS: "17.2", macOS: "14.2")
  }
}

extension Target {

  public static func createTarget(
    target: Targets,
    destinations: Destinations
  ) -> Target {
    .target(
      name: target.name,
      destinations: destinations,
      product: .framework,
      bundleId: "com.example.\(target.name)",
      deploymentTargets: .macOSAndiOS,
      infoPlist: .default,
      sources: ["\(target.path.pathString)/Sources/**"],
      resources: [],
      dependencies: []
    )
  }

  public static func createTestTarget(
    target: Targets,
    destinations: Destinations
  ) -> Target {
    .target(
      name: "\(target.name)Tests",
      destinations: destinations,
      product: .unitTests,
      bundleId: "com.example.\(target.name)Tests",
      deploymentTargets: .macOSAndiOS,
      infoPlist: .default,
      sources: ["\(target.path.pathString)/Tests/**"],
      resources: [],
      dependencies: [.target(name: target.name)]
    )

  }
}

// MARK: - Creating app

extension Target {

  public static func app(
    name: String,
    destinations: Destinations,
    additionalTargets: [Targets]
  ) -> [Target] {
    let targets = makeAppTargets(
      name: name,
      destinations: destinations,
      dependencies: additionalTargets
        .map { TargetDependency.target(name: $0.name) }
    )
    return targets
  }

  /// Helper function to create the application target and the unit test target.
  private static func makeAppTargets(
    name: String,
    destinations: Destinations,
    dependencies: [TargetDependency]
  ) -> [Target] {
    let infoPlist: [String: Plist.Value] = [
      "CFBundleShortVersionString": "1.0",
      "CFBundleVersion": "1",
      "UILaunchStoryboardName": "LaunchScreen",
    ]

    let mainTarget: Target = .target(
      name: name,
      destinations: destinations,
      product: .app,
      bundleId: "com.example.\(name)",
      deploymentTargets: .macOSAndiOS,
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Targets/\(name)/Sources/**"],
      resources: ["Targets/\(name)/Resources/**"],
      scripts: [.swiftFormat],
      dependencies: dependencies
    )

    let testTarget: Target = .target(
      name: "\(name)Tests",
      destinations: destinations,
      product: .unitTests,
      bundleId: "com.example.\(name)Tests",
      deploymentTargets: .macOSAndiOS,
      infoPlist: .default,
      sources: ["Targets/\(name)/Tests/**"],
      dependencies: [
        .target(name: "\(name)"),
      ]
    )
    return [mainTarget, testTarget]
  }
}

extension TargetScript {

  static var swiftFormat: TargetScript {
    .pre(
      tool: "swiftformat",
      arguments: ["--config", "swift.swiftformat", "."],
      name: "swiftformat"
    )
  }
}
