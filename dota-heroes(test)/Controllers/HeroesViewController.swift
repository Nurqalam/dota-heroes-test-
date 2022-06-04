//
//  HeroesViewController.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 30.05.2022.
//

import Foundation
import UIKit


class HeroesViewController: UIViewController {
 
    private let collectionView = HeroesCollectionView(frame: .zero,
                                                      collectionViewLayout: UICollectionViewFlowLayout())
    
    var heroes = [HeroModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
        
        downloadJSON {
            self.collectionView.reloadData()
            print("success")
        }
    }
    
    private func setupViews() {
        title = "Dota Heroes"
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
    }
    
}


//MARK: - URLSession
extension HeroesViewController {
    func downloadJSON(completed: @escaping () -> ()) {
        guard let url = URL(string: "https://api.opendota.com/api/heroStats") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil {
                do {
                    self.heroes = try JSONDecoder().decode([HeroModel].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("error fetching data from api")
                }
            }
        }.resume()
    }
}


//MARK: - UICollectionViewDataSource
extension HeroesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HeroesCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        let hero = heroes[indexPath.row]
        let imgUrl = "https://api.opendota.com" + hero.img
        
        cell.nameHeroLabel.text = hero.localized_name
        cell.heroImageView.downloaded(from: imgUrl)
        
        cell.heroImageView.contentMode = .scaleToFill
        cell.heroImageView.clipsToBounds = true
        cell.heroImageView.layer.cornerRadius = 15
        
        return cell
    }
    
    
}

//MARK: - setConstraints
extension HeroesViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

