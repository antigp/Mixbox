import MixboxUiTestsFoundation
import MixboxIpcCommon
import MixboxFoundation
import MixboxReporting

class GrayBoxLegacyNetworkStubbingBridgedUrlProtocolClass:
    BridgedUrlProtocolClass,
    GrayBoxLegacyNetworkStubbingNetworkStubRepository
{
    private let urlProtocolStubAdder: UrlProtocolStubAdder
    private let testFailureRecorder: TestFailureRecorder
    
    private var stubs = [GrayBoxLegacyNetworkStubbingNetworkStub]()
    private var addedStub: AddedUrlProtocolStub?
    
    init(
        urlProtocolStubAdder: UrlProtocolStubAdder,
        testFailureRecorder: TestFailureRecorder)
    {
        self.urlProtocolStubAdder = urlProtocolStubAdder
        self.testFailureRecorder = testFailureRecorder
    }
    
    // MARK: - BridgedUrlProtocolClass
    
    func canInit(with request: BridgedUrlRequest) throws -> Bool {
        return try matchingStub(request: request) != nil
    }
    
    func canonicalRequest(for request: BridgedUrlRequest) throws -> BridgedUrlRequest {
        return request
    }
    
    func requestIsCacheEquivalent(_ a: BridgedUrlRequest, to b: BridgedUrlRequest) throws -> Bool {
        return false
    }
    
    func createInstance(
        request: BridgedUrlRequest,
        cachedResponse: BridgedCachedUrlResponse?,
        client: BridgedUrlProtocolClient & IpcObjectIdentifiable)
        throws
        -> BridgedUrlProtocolInstance & IpcObjectIdentifiable
    {
        guard let stub = try matchingStub(request: request) else {
            // This might be handled differently:
            throw ErrorString(
                """
                No matching stub found while `createInstance` was called. \
                This is either an internal error or a race. This might be an expected situation, \
                and if so, this should be handled differently (see the code).
                """
            )
        }
        
        return GrayBoxLegacyNetworkStubbingBridgedUrlProtocolInstance(
            request: request,
            cachedResponse: cachedResponse,
            client: client,
            stub: stub
        )
    }
    
    private func matchingStub(request: BridgedUrlRequest) throws -> GrayBoxLegacyNetworkStubbingNetworkStub? {
        for stub in stubs.reversed() {
            if stub.matches(request: request) {
                return stub
            }
        }
        
        return nil
    }
    
    // MARK: - GrayBoxLegacyNetworkStubbingNetworkStubRepository
    
    func add(stub: GrayBoxLegacyNetworkStubbingNetworkStub) {
        do {
            if stubs.isEmpty {
                addedStub = try urlProtocolStubAdder.addStub(bridgedUrlProtocolClass: self)
            }
            
            stubs.append(stub)
        } catch {
            testFailureRecorder.recordFailure(
                description: "Failed to `urlProtocolStubAdder.addStub`: \(error)",
                fileLine: .current(),
                shouldContinueTest: false
            )
        }
    }
    
    func removeAllStubs() {
        stubs.removeAll()
        addedStub?.remove()
    }
    
}
