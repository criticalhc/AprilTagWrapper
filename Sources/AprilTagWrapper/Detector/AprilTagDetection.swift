//
//  AprilTagDetection.swift
//  AprilTagWrapper
//
//  Created by Heydon Costello on 22/08/2025.
//

import AprilTag

public struct AprilTagDetection {
    private let cDetection: UnsafeMutablePointer<apriltag_detection>

    init(cDetection: UnsafeMutablePointer<apriltag_detection>) {
        self.cDetection = cDetection
    }

    public var id: Int { Int(cDetection.pointee.id) }
    public var hamming: Int { Int(cDetection.pointee.hamming) }
    public var decisionMargin: Float { cDetection.pointee.decision_margin }
    public var center: (Double, Double) {
        let c = cDetection.pointee.c
        return (c.0, c.1)
    }
    public var corners: [(Double, Double)] {
        let p = cDetection.pointee.p
        return [
            (p.0.0, p.0.1),
            (p.1.0, p.1.1),
            (p.2.0, p.2.1),
            (p.3.0, p.3.1)
        ]
    }
}
