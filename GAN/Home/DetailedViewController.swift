//
//  DetailedViewController.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import UIKit

final class DetailedViewController: UIViewController {
    private var textField: UITextField = {
        let text = UITextField()
        text.font = UIFont.boldSystemFont(ofSize: 15)
        text.tintColor = .red
        text.adjustsFontSizeToFitWidth = true
        return text
    }()
    
    private let presenter: DetailedPresenterProtocol
    
    init(presenter: DetailedPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(textField)
        textField.anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            paddingTop: 32,
            height: 200
        )
        setupContent()
    }
    
    private func setupContent() {
        let character = presenter.character
        title = character?.name
        if let nickname = character?.nickname, let occupation = character?.occupation {
            textField.text = " \(nickname) \n \(occupation) ... ..."
        }
    }
    
}
