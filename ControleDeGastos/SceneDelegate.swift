import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let rootViewController = LoginViewController() // Tela de Login
        
        interactor.presenter = presenter
        presenter.loginViewController = rootViewController
        
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }
}
