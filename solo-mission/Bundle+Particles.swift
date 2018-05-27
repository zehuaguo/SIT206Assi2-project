//
//  Bundle+Particles.swift
//  solo-mission
//
//  Created by zehua guo on 2018/5/24.
//  Copyright © 2018年 zehua guo. All rights reserved.
//

import SpriteKit

extension Bundle {
    
    func emitterNode(_ name: String) -> SKEmitterNode? {
        guard let path = self.path(forResource: name, ofType: "sks") else {
            return nil
        }
        if let emitter = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? SKEmitterNode {
            return emitter
        }
        return nil
    }
    
}

