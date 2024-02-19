//
//  MainModules.swift
//  ProjectDescriptionHelpers
//
//  Created by Mustafa Khalil on 2023-12-08.
//

import ProjectDescription

extension Target {
  public static var core: Target {
    createTarget(target: .core, destinations: [.iPhone, .mac])
  }

  public static var userInterface: Target {
    createTarget(target: .userInterface, destinations: [.iPhone, .mac])
  }

  public static var coreTests: Target {
    createTestTarget(target: .core, destinations: [.iPhone, .mac])
  }

  public static var userInterfaceTests: Target {
    createTestTarget(target: .userInterface, destinations: [.iPhone, .mac])
  }
}
