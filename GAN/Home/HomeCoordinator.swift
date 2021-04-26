//
//  HomeCoordinator.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import UIKit

protocol HomeCoordinatorProtocol: Coordinator {
    func navigateToCharacter() // Example of further navigation
}

final class HomeCoordinator: HomeCoordinatorProtocol {
    var childCoordinators = [Coordinator]()

    private let navigationController: UINavigationController
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }

    func start() {
        let presenter = HomePresenter(coordinator: self)
        let home = HomeViewController(presenter: presenter)
        presenter.view = home
        navigationController.setViewControllers([home], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    // Example: Navigate to another coordinator
    func navigateToCharacter() {

    }
}
