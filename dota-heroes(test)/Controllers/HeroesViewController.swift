//
//  HeroesViewController.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 30.05.2022.
//

import Foundation
import UIKit


class HeroesViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tablView = UITableView()
        tablView.register(HeroesViewControllerCell.self, forCellReuseIdentifier: "cell")
        tablView.translatesAutoresizingMaskIntoConstraints = false
        return tablView
    }()
    
    
    private let searchController = UISearchController(searchResultsController: nil)
    
//    var albums = [Album]()
    var timer: Timer?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
        setNavigationBar()
        setupSearchController()
        
    }
    
    
    private func setupViews() {
        view.addSubview(tableView)
        title = "Dota Heroes"
        
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchBar.delegate = self
    }
    
    private func setNavigationBar() {
        title = "Albums"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.tintColor = .black
        navigationItem.searchController = searchController
        
    }
    
    private func setupSearchController() {
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}


// MARK: - UISearchBarDelegate
extension HeroesViewController: UISearchBarDelegate {
    
}


// MARK: - UITableViewDelegate
extension HeroesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


// MARK: - UITableViewDataSource
extension HeroesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HeroesViewControllerCell else {
            return UITableViewCell()
        }
        return cell
    }
}


// MARK: - setConstraints
extension HeroesViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

    

