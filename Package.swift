// swift-tools-version:5.3
 
import PackageDescription
import Foundation
func cSettings() -> [CSetting] {
    #if compiler(>=5.3)
    return [.define("MIXBOX_ENABLE_IN_APP_SERVICES", to: "1", .when(platforms: nil, configuration: .debug)),
            .define("SWIFT_PACKAGE"),
            .define("__IPHONE_OS_VERSION_MAX_ALLOWED", to: "140000", .when(platforms: nil, configuration: .debug))]
    #else
    return [.define("MIXBOX_ENABLE_IN_APP_SERVICES", to: "1", .when(platforms: nil, configuration: .debug)),
            .define("SWIFT_PACKAGE"),
            .define("__IPHONE_OS_VERSION_MAX_ALLOWED", to: "130000", .when(platforms: nil, configuration: .debug))]
    #endif
}

func cxxSettings() -> [CXXSetting] {
    #if compiler(>=5.3)
    return [.define("MIXBOX_ENABLE_IN_APP_SERVICES", to: "1", .when(platforms: nil, configuration: .debug)),
            .define("SWIFT_PACKAGE"),
            .define("__IPHONE_OS_VERSION_MAX_ALLOWED", to: "140000", .when(platforms: nil, configuration: .debug))]
    #else
    return [.define("MIXBOX_ENABLE_IN_APP_SERVICES", to: "1", .when(platforms: nil, configuration: .debug)),
            .define("SWIFT_PACKAGE"),
            .define("__IPHONE_OS_VERSION_MAX_ALLOWED", to: "130000", .when(platforms: nil, configuration: .debug))]
    #endif
}

func swiftSettings() -> [SwiftSetting] {
    return [.define("MIXBOX_ENABLE_IN_APP_SERVICES", .when(platforms: nil, configuration: .debug)),
            .define("SWIFT_PACKAGE")]
}

// sudo ln -s /System/Library/PrivateFrameworks/XCTAutomationSupport.framework /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Library/Frameworks
let package = Package(
    name: "Mixbox",
    platforms: [
        .iOS(.v9),
        .macOS("10.15")
    ], 
    products: [
        .library(name: "MixboxAnyCodable", type: .static, targets: [ "MixboxAnyCodable" ]),
        .library(name: "MixboxBlack", type: .static, targets: ["MixboxBlack"]),
        .library(name: "MixboxBuiltinIpc", type: .static, targets: ["MixboxBuiltinIpc"]),
        .library(name: "MixboxDi", type: .static, targets: ["MixboxDi"]),
        .library(name: "MixboxBuiltinDi", type: .static, targets: ["MixboxBuiltinDi"]),
        .library(name: "MixboxFakeSettingsAppMain", type: .static, targets: ["MixboxFakeSettingsAppMain"]),
        .library(name: "MixboxFoundation", type: .static, targets: ["MixboxFoundation"]),
        .library(name: "MixboxGenerators", type: .static, targets: ["MixboxGenerators"]),
        .library(name: "MixboxGray", type: .static, targets: ["MixboxGray"]),
        .library(name: "MixboxInAppServices", type: .static, targets: ["MixboxInAppServices", "MixboxInAppServices_objc"]),
        .library(name: "MixboxIoKit", type: .static, targets: ["MixboxIoKit_objc", "MixboxIoKit"]),
        .library(name: "MixboxIpc", type: .static, targets: ["MixboxIpc"]),
        .library(name: "MixboxIpcCommon", type: .static, targets: ["MixboxIpcCommon"]),
        .library(name: "MixboxIpcSbtuiClient", type: .static, targets: ["MixboxIpcSbtuiClient"]),
        .library(name: "MixboxIpcSbtuiHost", type: .static, targets: ["MixboxIpcSbtuiHost"]),
        .library(name: "MixboxTestability", type: .static, targets: ["MixboxTestability"]),
        .library(name: "MixboxTestsFoundation", type: .static, targets: ["MixboxTestsFoundation"]),
        .library(name: "MixboxUiKit", type: .static, targets: ["MixboxUiKit"]),
        .library(name: "MixboxUiTestsFoundation", type: .static, targets: ["MixboxUiTestsFoundation"]),
    ],
    dependencies: [
            .package(url: "https://github.com/AliSoftware/Dip", from: Version(7, 1, 1)),
            .package(url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.12.0"),
            .package(name: "CocoaImageHashing", url: "https://github.com/ameingast/cocoaimagehashing.git", from: "1.8.0"),
            .package(url: "https://github.com/antigp/SBTUITestTunnel.git", .branch("spm_3.0.6")),
            .package(name: "GCDWebServer", url: "https://github.com/SlaunchaMan/GCDWebServer.git", .revision("5cc010813d797c3f40557c740a4f620bf84da4dd")),
    ],
    targets: [
        .binaryTarget(
            name: "XCTAutomationSupport",
            path: "artifacts/XCTAutomationSupport.xcframework"
        ),     
        // MARK: - MixboxAnyCodable
        .target(
            name: "MixboxAnyCodable",
            dependencies: [],
            path: "Frameworks/AnyCodable",
            cSettings: cSettings(),
            cxxSettings: cxxSettings(),
            swiftSettings: swiftSettings()
        ),
         
        // MARK: - MixboxBlack
        .target(name: "MixboxBlack_objc",
                dependencies: [
                    .target(name: "MixboxUiTestsFoundation"),
                    .target(name: "MixboxIpcSbtuiClient"),
                    .target(name: "MixboxDi")
                ],
                path: "Frameworks/Black",
                sources: ["Utils/ActionDependencies/EventGenerator/XcuiEventGeneratorObjC"],
                publicHeadersPath: ".",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings(),
                linkerSettings: [.linkedFramework("XCTest")]),
        .target(name: "MixboxBlack",
                dependencies: [
                    .target(name: "MixboxUiTestsFoundation"),
                    .target(name: "MixboxIpcSbtuiClient"),
                    .target(name: "MixboxDi"),
                    .target(name: "MixboxBlack_objc"),
                    .target(name: "XCTAutomationSupport")
                ],
                path: "Frameworks/Black",
                exclude: ["Utils/ActionDependencies/EventGenerator/XcuiEventGeneratorObjC"],
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings(),
                linkerSettings: [.linkedFramework("XCTest"),.linkedLibrary("swiftXCTest"), .linkedFramework("XCTAutomationSupport")]),
        
        // MARK: - MixboxBuiltinIpc
        .target(name: "MixboxBuiltinIpc_objc", dependencies: [
                    .target(name: "MixboxIpc"),
                    "GCDWebServer"
                ],
                path: "Frameworks/BuiltinIpc",
                sources: ["Sources/Server/GCDWebServerErrorResponse+Swift.m"],
                publicHeadersPath: ".",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()
        ),
        .target(name: "MixboxBuiltinIpc", dependencies: [
                    .target(name: "MixboxIpc"),
                    "GCDWebServer",
                    .target(name: "MixboxBuiltinIpc_objc")
                ],
                path: "Frameworks/BuiltinIpc",
                exclude: ["Sources/Server/GCDWebServerErrorResponse+Swift.m"],
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        
        // MARK: - MixboxDi
        .target(name: "MixboxDi",
                dependencies: [
                    "Dip",
                    .target(name: "MixboxFoundation")
                ],
                path: "Frameworks/Di",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        
        // MARK: - MixboxDi
        .target(name: "MixboxBuiltinDi",
                dependencies: [
                    .target(name: "MixboxDi"),
                    .target(name: "MixboxFoundation")
                ],
                path: "Frameworks/BuiltinDi",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        
        // MARK: - MixboxFakeSettingsAppMain
        .target(name: "MixboxFakeSettingsAppMain",
                dependencies: [
                    "Dip",
                    .target(name: "MixboxFoundation"),
                ],
                path: "Frameworks/FakeSettingsAppMain"),
        
        // MARK: - MixboxFoundation
        .target(name: "MixboxFoundation_objc",
                dependencies: [
                ],
                path: "Frameworks/Foundation/ObjCSource",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()
        ),
        .target(name: "MixboxFoundation",
                dependencies: [
                    .target(name: "MixboxFoundation_objc")
                ],
                path: "Frameworks/Foundation",
                exclude: ["ObjCSource"],
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings(),
                linkerSettings: [.linkedFramework("Foundation")] ),
        
        // MARK: - MixboxGenerator
        .target(name: "MixboxGenerators",
                dependencies: [
                    .target(name: "MixboxDi")
                ],
                path: "Frameworks/Generators",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        
        // MARK: - MixboxGray
        .target(name: "MixboxGray",
                dependencies: [
                    .target(name: "MixboxUiTestsFoundation"),
                    .target(name: "MixboxUiKit"),
                    .target(name: "MixboxInAppServices"),
                    .target(name: "MixboxDi"),
                    .target(name: "MixboxGray_objc"),
                    .target(name: "XCTAutomationSupport")
                ],
                path: "Frameworks/Gray",
                exclude: ["Utils/PrivateHeaders"],
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        .target(name: "MixboxGray_objc",
                dependencies: [
                    .target(name: "MixboxUiTestsFoundation"),
                    .target(name: "MixboxTestsFoundation_objc"),
                    .target(name: "MixboxUiKit"),
                    .target(name: "MixboxInAppServices"),
                    .target(name: "MixboxDi"),
                ],
                path: "Frameworks/Gray",
                sources: ["Utils/PrivateHeaders"],
                publicHeadersPath: ".",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        
        // MARK: - MixboxInAppServices
        .target(name: "MixboxInAppServices_objc",
                dependencies: [
                    .target(name: "MixboxIpcCommon"),
                    .target(name: "MixboxTestability"),
                    .target(name: "MixboxIpcSbtuiHost"),
                    .target(name: "MixboxBuiltinIpc"),
                    .target(name: "MixboxIoKit"),
                    .target(name: "MixboxIoKit_objc")
                ],
                path: "Frameworks/InAppServices",
                sources: ["Support/IPC/IpcStarter/Graybox/PrivateApi/AccessibilityOnSimulatorInitializer.m",
                          "Features/AccessibilityEnchancement/Support/VisibilityChecker/CGGeometry+Extensions.m",
                          "Features/AccessibilityEnchancement/Support/VisibilityChecker/ScreenshotUtil.m",
                          "Features/AccessibilityEnchancement/Support/VisibilityChecker/UIView+Extensions.m",
                          "Features/AccessibilityEnchancement/Support/VisibilityChecker/VisibilityChecker.m",
                          "Features/AccessibilityEnchancement/Support/VisibilityChecker/WindowProvider.m"
                ],
                publicHeadersPath: ".",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        .target(name: "MixboxInAppServices",
                dependencies: [
                    .target(name: "MixboxIpcCommon"),
                    .target(name: "MixboxTestability"),
                    .target(name: "MixboxIpcSbtuiHost"),
                    .target(name: "MixboxBuiltinIpc"),
                    .target(name: "MixboxIoKit"),
                    .target(name: "MixboxInAppServices_objc"),
                    .target(name: "MixboxUiKit"),
                    .target(name: "MixboxIoKit_objc")
                ],
                path: "Frameworks/InAppServices",
                exclude: [
                    "Support/IPC/IpcStarter/Graybox/PrivateApi/",
                    "Features/AccessibilityEnchancement/Support/VisibilityChecker/WindowProvider.m"
                ],
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        // MARK: - MixboxIoKit
        .target(name: "MixboxIoKit_objc",
                dependencies: [
                    .target(name: "MixboxFoundation"),
                    .target(name: "MixboxFoundation_objc") 
                ],
                path: "Frameworks/IoKit/Sources",
                sources: [
                    "IOKitExtensions/EnumRawValues.m",
                    "MBIohidEventSender/MBIohidEventSender.mm"
                ],
                publicHeadersPath: ".",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()
        ),
        .target(name: "MixboxIoKit",
                dependencies: [
                    .target(name: "MixboxFoundation"),
                    .target(name: "MixboxIoKit_objc")
                ],
                path: "Frameworks/IoKit/Sources",
                exclude: [
                    "IOKitExtensions/EnumRawValues.m",
                    "MBIohidEventSender/MBIohidEventSender.mm",
                    "PrivateApi"
                ],
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings(),
                linkerSettings: [.linkedFramework("IOKit")]),
        
        // MARK: - MixboxIpc
        .target(name: "MixboxIpc",
                dependencies: [
                    .target(name: "MixboxFoundation")
                ],
                path: "Frameworks/Ipc",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()
        ),
        
        // MARK: - MixboxIpcCommon
        .target(name: "MixboxIpcCommon",
                dependencies: [
                    .target(name: "MixboxIpc"),
                    .target(name: "MixboxAnyCodable")
                ],
                path: "Frameworks/IpcCommon",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        
        // MARK: - MixboxIpcSbtuiClient
        .target(name: "MixboxIpcSbtuiClient",
                dependencies: [
                    .target(name: "MixboxIpc"),
                    .product(name: "SBTUITestTunnelClient", package: "SBTUITestTunnel"),
                    .target(name: "MixboxTestsFoundation"),
                    .target(name: "MixboxUiTestsFoundation"),
                ],
                path: "Frameworks/IpcSbtuiClient",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        
        // MARK: - MixboxIpcSbtuiHost
        .target(name: "MixboxIpcSbtuiHost",
                dependencies: [
                    .target(name: "MixboxIpc"),
                    .product(name: "SBTUITestTunnelServer", package: "SBTUITestTunnel"),
                ],
                path: "Frameworks/IpcSbtuiHost",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        
        // MARK: - MixboxTestability
        .target(name: "MixboxTestability_objc",
                dependencies: [
                ],
                path: "Frameworks/Testability",
                sources: [
                    "Sources/CommonValues/NSObject+Testability.m",
                    "Sources/CommonValues/Support/ObjectiveC"
                ],
                publicHeadersPath: ".",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        .target(name: "MixboxTestability",
                dependencies: [
                    .target(name: "MixboxTestability_objc"),
                    .target(name: "MixboxFoundation"),
                    .target(name: "MixboxUiKit")
                ],
                path: "Frameworks/Testability",
                exclude: [
                    "Sources/CommonValues/NSObject+Testability.m",
                    "Sources/CommonValues/Support/ObjectiveC"
                ],
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
          
        // MARK: - MixboxTestsFoundation
        .target(name: "MixboxTestsFoundation_objc",
                dependencies: [
                ],
                path: "Frameworks/TestsFoundation",
                sources: ["ObjcSources"],
                publicHeadersPath: "PrivateHeaders",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        .target(name: "MixboxTestsFoundation",
                dependencies: [
                    .target(name: "MixboxFoundation"),
                    .target(name: "MixboxUiKit"),
                    .target(name: "MixboxTestsFoundation_objc"),
                    .product(name: "SQLite", package: "SQLite.swift"),
                    .target(name: "XCTAutomationSupport")
                ],
                path: "Frameworks/TestsFoundation",
                exclude: ["ObjcSources", "PrivateHeaders"],
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        
        // MARK: - MixboxUiKit
        .target(name: "MixboxUiKit",
                dependencies: [
                    .target(name: "MixboxFoundation"),
                    .product(name: "SBTUITestTunnelServer", package: "SBTUITestTunnel"),
                ],
                path: "Frameworks/UiKit",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings()),
        
        // MARK: - MixboxUiTestsFoundation
        .target(name: "MixboxUiTestsFoundation",
                dependencies: [
                    .target(name: "MixboxTestsFoundation"),
                    .target(name: "MixboxUiKit"),
                    .target(name: "MixboxAnyCodable"),
                    "CocoaImageHashing",
                    .target(name: "MixboxIpcCommon"), 
                    .target(name: "MixboxDi")
                ],
                path: "Frameworks/UiTestsFoundation",
                cSettings: cSettings(),
                cxxSettings: cxxSettings(),
                swiftSettings: swiftSettings())
    ]
)
