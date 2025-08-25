//
//  AprilTagFamily.swift
//  AprilTagWrapper
//
//  Created by Heydon Costello on 25/08/2025.
//


import AprilTag

public final class AprilTagFamily {
    let ptr: UnsafeMutablePointer<apriltag_family_t>

    public init?(name: String) {
        switch name {
        case "tag16h5":
            guard let fam = tag16h5_create() else { return nil }
            self.ptr = fam
        default:
            return nil
        }
    }

    deinit {
        if ptr.pointee.name != nil {
            // match with tag16h5_destroy (or other family-specific destroyers)
        }
    }

    public var name: String {
        String(cString: ptr.pointee.name)
    }
}
