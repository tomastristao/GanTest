//
//  ViewController.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func fetchDidFinish()
}

final class HomeViewController: UIViewController {
    
    private let presenter: HomePresenterProtocol
    
    init(presenter: HomePresenterProtocol){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}

extension HomeViewController: HomeViewProtocol {
    func fetchDidFinish() {
        
    }
}

