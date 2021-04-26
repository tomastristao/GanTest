//
//  DetailedCoordinator.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import UIKit

protocol DetailedCoordinatorProtocol: Coordinator {
    func dismiss()
}

final class DetailedCoordinator: DetailedCoordinatorProtocol {
    var childCoordinators = [Coordinator]()
    private weak var parent: Coordinator?
    private var navigationController: UINavigationController
    var character: BBCharacter?
   
    init(navigationController: UINavigationController, parent: Coordinator, character: BBCharacter) {
        self.navigationController = navigationController
        self.parent = parent
        self.character = character
    }

    func start() {
        if let character = character {
            let presenter = DetailedPresenter(coordinator: self, character: character)
            let viewController = DetailedViewController(presenter: presenter)
            navigationController.present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
        }
    }

    func dismiss() {
       // finishModal(viewController: navigationController, parent: parent, animated: true)
    }
}
