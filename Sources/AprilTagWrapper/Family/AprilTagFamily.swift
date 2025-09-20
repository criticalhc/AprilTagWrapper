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
        case "tag36h11":
            guard let fam = tag36h11_create() else { return nil }
            self.ptr = fam
        case "tag25h9":
            guard let fam = tag25h9_create() else { return nil }
            self.ptr = fam
        case "tag16h5":
            guard let fam = tag16h5_create() else { return nil }
            self.ptr = fam
        case "tagCircle21h7":
            guard let fam = tagCircle21h7_create() else { return nil }
            self.ptr = fam
        case "tagCircle49h12":
            guard let fam = tagCircle49h12_create() else { return nil }
            self.ptr = fam
        case "tagStandard41h12":
            guard let fam = tagStandard41h12_create() else { return nil }
            self.ptr = fam
        case "tagStandard52h13":
            guard let fam = tagStandard52h13_create() else { return nil }
            self.ptr = fam
        case "tagCustom48h12":
            guard let fam = tagCustom48h12_create() else { return nil }
            self.ptr = fam
        default:
            return nil
        }
    }

    deinit {
        if ptr.pointee.name != nil {
            tag16h5_destroy(self.ptr)
        }
    }

    public var name: String {
        String(cString: ptr.pointee.name)
    }
}


/*
 - "tag36h11"
 - "tag25h9"
 - "tag16h5"
 - "tagCircle21h7"
 - "tagCircle49h12"
 - "tagStandard41h12"
 - "tagStandard52h13"
 - "tagCustom48h12"

 */
