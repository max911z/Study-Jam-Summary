import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    lazy var coordinator: Coordinator = {
        AppCoordinator(navigationController: self.rootViewController)
    }()
    
    let rootViewController = UINavigationController()

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = .init(windowScene: windowScene)
        rootViewController.isNavigationBarHidden = true
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        coordinator.start()
    }
}

