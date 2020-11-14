#if MIXBOX_ENABLE_IN_APP_SERVICES

import MixboxIpc
import Foundation

public final class UrlProtocolDidLoadIpcMethod: IpcMethod {
    public final class _Arguments: Codable {
        public let selfIpcObjectId: IpcObjectId
        public let data: Data
        
        public init(
            selfIpcObjectId: IpcObjectId,
            data: Data)
        {
            self.selfIpcObjectId = selfIpcObjectId
            self.data = data
        }
    }
    
    public typealias Arguments = _Arguments
    public typealias ReturnValue = IpcThrowingFunctionResult<IpcVoid>
    
    public init() {
        
    }
}

#endif
