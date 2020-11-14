import MixboxTestsFoundation

public protocol PageObjectDependenciesFactory: class {
    var di: TestFailingDependencyResolver { get }
}
 
extension PageObjectDependenciesFactory {
    public var pageObjectElementCoreFactory: PageObjectElementCoreFactory { di.resolve() }
    public var matcherBuilder: ElementMatcherBuilder { di.resolve() }
    public var elementSettingsDefaultsProvider: ElementSettingsDefaultsProvider { di.resolve() }
    public var matcherBulder: ElementMatcherBuilder { di.resolve() }
}
