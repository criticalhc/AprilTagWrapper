# AprilTagWrapper

A Swift package that provides a safe, Swift-friendly wrapper around the AprilTag C library for detecting and decoding AprilTags in images.  
AprilTags are robust fiducial markers widely used in robotics, AR/VR, and computer vision tasks. This package allows you to leverage AprilTag detection directly in your Swift projects, including iOS, macOS, and server-side Swift environments.

---

## Features
- Swift API wrapping the underlying C AprilTag library  
- Detect AprilTags in images (`CGImage`, `CVPixelBuffer`, or raw buffers)  
- Access detection results such as tag ID, family, pose, and corner coordinates  
- Cross-platform: iOS, macOS, Linux (via SwiftPM)  

---

## Installation

### Swift Package Manager

Add the package to your `Package.swift`:  

```swift
dependencies: [
    .package(url: "https://github.com/criticalhc/AprilTagWrapper.git", from: "0.1.0")
]

