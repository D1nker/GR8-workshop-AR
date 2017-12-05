//
//  
//  AR-Portal
//
//  Created by Quentin Faure on 05/12/2017.
//  Copyright © 2017 Quentin Faure. All rights reserved.
//

import Foundation
import SceneKit

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

extension SCNVector3 {
    // from Apples demo APP
    static func positionFromTransform(_ transform: matrix_float4x4) -> SCNVector3 {
        return SCNVector3Make(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
    }
}
