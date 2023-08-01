import UIKit

final class MainCoordinator: BaseNavigationCoordinator {
    
    // MARK: - Init
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Start
    
    override func start() {
        startSummaryScreen()
    }
    
    // MARK: - Private Methods
    
    private func startSummaryScreen() {
        let viewController = SummaryScreenAssembly.make()
        navigationController.pushViewController(viewController, animated: true)
    }
}
