import Foundation
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    var isRunningTests: Bool {
        let environment = ProcessInfo.processInfo.environment
        return environment["XCInjectBundleInto"] != nil
    }

    func scene(_ scene: UIScene,
               willConnectTo _: UISceneSession,
               options _: UIScene.ConnectionOptions)
    {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene
        // `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see
        // `application:configurationForConnectingSceneSession` instead).

        guard !isRunningTests else {
            return
        }

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UINavigationController(rootViewController: ContentViewController())
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see
        // `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for context in URLContexts {
            RCTLinkingManager.application(
                UIApplication.shared,
                open: context.url,
                options: context.options.dictionary()
            )
        }

        NotificationCenter.default.post(
            name: .ReactTestAppSceneDidOpenURL,
            object: [
                "scene": scene,
                "URLContexts": URLContexts,
            ]
        )
    }
}

extension UIScene.OpenURLOptions {
    func dictionary() -> [UIApplication.OpenURLOptionsKey: Any] {
        var options: [UIApplication.OpenURLOptionsKey: Any] = [:]

        if let sourceApplication = sourceApplication {
            options[.sourceApplication] = sourceApplication
        }

        if let annotation = annotation {
            options[.annotation] = annotation
        }

        options[.openInPlace] = openInPlace

        if #available(iOS 14.5, *) {
            if let eventAttribution = eventAttribution {
                options[.eventAttribution] = eventAttribution
            }
        }

        return options
    }
}
