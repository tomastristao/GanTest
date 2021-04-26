//
//  HomePresenter.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import Foundation

protocol HomePresenterProtocol {
    var plot: [BBCharacter] { get }
    
    func fetchPlot()
    func didTapCharacter(index: Int)
}

final class HomePresenter: HomePresenterProtocol {
    private weak var coordinator: HomeCoordinatorProtocol?
    weak var view: HomeViewProtocol?
    
    private let api: APIServiceProtocol
    private var list = [BBCharacter]()
    
    var plot: [BBCharacter] {
        list
    }

    init(
        coordinator: HomeCoordinatorProtocol,
        api: APIServiceProtocol = APIService()
    ) {
        self.coordinator = coordinator
        self.api = api
    }
    
    func fetchPlot() {
        api.getPlot { [weak self] result in
            switch result {
            case .success(let characters):
                self?.list = characters
                self?.view?.fetchDidFinish()
            case .failure(let error):
                //Deal with error
                print(error)
                break
            }

        }
    }
     
    func didTapCharacter(index: Int) {
        let character = list[index]
        coordinator?.navigateToCharacter(character)
    }
}
