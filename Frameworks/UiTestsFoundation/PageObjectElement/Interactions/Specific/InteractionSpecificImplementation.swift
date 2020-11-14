// `Interaction` is a generic interaction with an element.
// All specific lies inside `InteractionSpecificImplementation` which is stored by `Interaction`.
// E.g. every interaction needs to find an element. Only interaction for tapping needs to tap an element.
public final class InteractionSpecificImplementation {
    public typealias ExecuteFunction = (_ result: SnapshotForInteractionResolverResult) -> InteractionResult
    private let execute: ExecuteFunction
    
    public init(execute: @escaping ExecuteFunction) {
        self.execute = execute
    }
    
    public func perform(resolverResult: SnapshotForInteractionResolverResult) -> InteractionResult {
        return execute(resolverResult)
    }
}
