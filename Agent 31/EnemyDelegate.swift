//
//  EnemyDelegate.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 12/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation
import CoreGraphics

protocol EnemyDelegate {
    func calculateDistanceToAgent( enemyPosition: CGPoint ) -> CGFloat;
}