//
//  MainModules.swift
//  ProjectDescriptionHelpers
//
//  Created by Mustafa Khalil on 2023-12-08.
//

import ProjectDescription

extension Target {
  public static var UI: Target {
    createTarget(target: .UI, destinations: [.iPhone, .mac])
  }

  public static var Kit: Target {
    createTarget(target: .Kit, destinations: [.iPhone, .mac])
  }

  public static var UITests: Target {
    createTestTarget(target: .UI, destinations: [.iPhone, .mac])
  }

  public static var KitTests: Target {
    createTestTarget(target: .Kit, destinations: [.iPhone, .mac])
  }
}
