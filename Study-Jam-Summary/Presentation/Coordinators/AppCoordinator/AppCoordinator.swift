import UIKit

final class AppCoordinator: BaseNavigationCoordinator {
    
    // MARK: - Private Properties
    
    private weak var mainCoordinator: MainCoordinator?
    
    // MARK: - Init
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    // MARK: - Start
    
    override func start() {
        startMainFlow()
    }
    
    // MARK: - Private Methodss
    
    private func startMainFlow() {
        let coordinator = MainCoordinator(navigationController: navigationController)

        add(child: coordinator)
        coordinator.start()
        mainCoordinator = coordinator
    }
}
