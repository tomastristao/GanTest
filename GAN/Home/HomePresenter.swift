//
//  HomePresenter.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import Foundation

protocol HomePresenterProtocol {
    
}

final class HomePresenter: HomePresenterProtocol {
    private weak var coordinator: HomeCoordinatorProtocol?
    weak var view: HomeViewProtocol?

    init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
