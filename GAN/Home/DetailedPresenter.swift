//
//  DetailedPresenter.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import UIKit

protocol DetailedPresenterProtocol {
    var character: BBCharacter? { get }

    func dismissModal()
}

final class DetailedPresenter: DetailedPresenterProtocol {
    private weak var coordinator: DetailedCoordinatorProtocol?
    
    private var detailedCharacter: BBCharacter?
    
    var character: BBCharacter? {
        if let detailedCharacter = detailedCharacter {
            return detailedCharacter
        }
        return nil
    }

    init(
        coordinator: DetailedCoordinatorProtocol,
        character: BBCharacter
    ) {
        self.coordinator = coordinator
        self.detailedCharacter = character
    }

    func dismissModal() {
        coordinator?.dismiss()
    }
}
