//
//  Function.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/6/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

/* 
 * Desenvolvimento de armas
 * 1 arma (gun1) inicial grátis
 * 1 arma (gun2) de 25 metais (5e2) em 10 minutos
 * 1 arma (gun3) de 125 metais (5e3) em 20 minutos
 * 2 armas (gun4, gun5) de 625 metais cada (5e4) em 30 minutos
 * 2 armas (gun6, gun7) de 3.125 metais cada (5e5) em 40 minutos
 * 3 armas (gun8, gun9, gun10) de 15.625 metais cada (5e6) em 50 minutos
 * 2 armas (gun11, gun12) de 78.125 metais cada (5e7) em 60 minutos
 * 2 armas (gun13, gun14) de 390.625 metais cada (5e8) em 70 minutos
 * 1 arma (gun15) de 1.953.125 metais (5e9) em 80 minutos
 *
 * Level up de armas
 * 2 * (metal para desenvolver)
 * 2 * (tempo para desenvolver)
 */
func gunLeveUp(gunName: String, gunLevel: Int) -> (timeLevelUp: NSTimeInterval, resourceLevelUp: Int)
{
    switch gunName {
        case "gun1":
            return (Double(gunLevel) * 300.0, gunLevel * 5)
        case "gun2":
            return (Double(gunLevel) * 600.0, gunLevel * 25)
        case "gun3":
            return (Double(gunLevel) * 1200.0, gunLevel * 125)
        case "gun4", "gun5":
            return (Double(gunLevel) * 1800.0, gunLevel * 625)
        case "gun6", "gun7":
            return (Double(gunLevel) * 2400.0, gunLevel * 3125)
        case "gun8", "gun9", "gun10":
            return (Double(gunLevel) * 3000.0, gunLevel * 15625)
        case "gun11", "gun12":
            return (Double(gunLevel) * 3600.0, gunLevel * 78125)
        case "gun13", "gun14":
            return (Double(gunLevel) * 4200.0, gunLevel * 390625)
        case "gun15":
            return (Double(gunLevel) * 4800.0, gunLevel * 1953125)
        default:
            return (0.00, 0)
    }
}

/*
 * Level up de atributos
 * 30 minutos e
 */
func attributeLevelUp(attributeName: String, attributeLevel: Int) -> (timeLevelUp: NSTimeInterval, resourceLevelUp: Int)
{
    return (Double(attributeLevel) * 1800, attributeLevel * 2000)
}