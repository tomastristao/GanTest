//
//  Coordinator.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }

    func start()
}

extension Coordinator {
    // This would be used when dismissing/poping view controllers
    func childDidStop(_ child: Coordinator) {
        childCoordinators.removeAll { $0 === child }
    }

    func start(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
