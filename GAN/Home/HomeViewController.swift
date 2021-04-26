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
    private lazy var tableView: UITableView = {
        let tableView: UITableView
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.rowHeight = 72
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self)
        return tableView
    }()
    
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
        presenter.fetchPlot()
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.plot.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as UITableViewCell
        let character = presenter.plot[indexPath.item]
        cell.textLabel?.text = character.name
        cell.imageView?.downloaded(from: character.img ?? "")
        cell.backgroundColor = .secondarySystemGroupedBackground
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapCharacter(index: indexPath.item)
    }
}

extension HomeViewController: HomeViewProtocol {
    func fetchDidFinish() {
        tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

