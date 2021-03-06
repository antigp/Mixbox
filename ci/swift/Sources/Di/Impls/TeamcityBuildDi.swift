import Dip
import Tasks
import Destinations
import CiFoundation
import SingletonHell
import Emcee

public final class TeamcityBuildDi: CommonDi {
    override public init() {}
    
    override public func registerAll(container: DependencyContainer) {
        super.registerAll(container: container)
        
        container.register(type: LocalTaskExecutor.self) {
            TeamcityLocalTaskExecutor()
        }
        container.register(type: RemoteCacheConfigProvider.self) {
            let environmentProvider: EnvironmentProvider = try container.resolve()
            
            return RemoteCacheConfigProviderImpl(
                fileDownloader: try container.resolve(),
                remoteCacheConfigJsonUrl: try environmentProvider.getUrlOrThrow(
                    env: Env.MIXBOX_CI_EMCEE_REMOTE_CACHE_CONFIG
                )
            )
        }
        container.register(type: DeveloperDirProvider.self) {
            let environmentProvider: EnvironmentProvider = try container.resolve()
            
            return DeveloperDirProviderImpl(
                xcodeCFBundleShortVersionString: try environmentProvider.getOrThrow(
                    env: Env.MIXBOX_CI_XCODE_VERSION
                ) 
            )
        }
        container.register(type: SimulatorSettingsProvider.self) {
            SimulatorSettingsProviderImpl(
                environmentProvider: try container.resolve()
            )
        }
    }
}
