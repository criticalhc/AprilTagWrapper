// The Swift Programming Language
// https://docs.swift.org/swift-book


import AprilTag

public final class AprilTagDetector {
    private var detector: UnsafeMutablePointer<apriltag_detector>

    public init() {
        self.detector = apriltag_detector_create()
    }

    deinit {
        apriltag_detector_destroy(detector)
    }

    public var nthreads: Int {
        get { Int(detector.pointee.nthreads) }
        set { detector.pointee.nthreads = Int32(newValue) }
    }

    public var quadDecimate: Float {
        get { detector.pointee.quad_decimate }
        set { detector.pointee.quad_decimate = newValue }
    }
}

extension AprilTagDetector {
    public func detect(image: UnsafeMutablePointer<image_u8_t>) -> [AprilTagDetection] {
        guard let dets = apriltag_detector_detect(detector, image) else {
            return []
        }

        var results: [AprilTagDetection] = []
        let count = zarray_size(dets)

        for i in 0..<count {
            var det: UnsafeMutablePointer<apriltag_detection>?
            zarray_get(dets, Int32(i), &det)
            if let det = det {
                results.append(AprilTagDetection(cDetection: det))
            }
        }

        zarray_destroy(dets)

        return results
    }
    
    
    public func addFamily(_ family: AprilTagFamily) {
        apriltag_detector_add_family(detector, family.ptr)
    }
}
