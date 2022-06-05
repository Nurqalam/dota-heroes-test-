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
        }
    }
    
    private func setupViews() {
        title = "Dota Heroes"
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        let rightBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.uturn.backward.circle.fill"),
                                       style: .plain,
                                       target: self,
                                       action: #selector(exitButtonPressed))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        navigationController?.navigationBar.tintColor = .black
    }
        
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectHeroDelegate = self
    }
    
    @objc private func exitButtonPressed() {
        let vc = UINavigationController(rootViewController: MainViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
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
                if let data = data {
                    do {
                        self.heroes = try JSONDecoder().decode([HeroModel].self, from: data)
                        DispatchQueue.main.async {
                            completed()
                        }
                    } catch {
                        print("error fetching data from api")
                    }
                }
            }
        }.resume()
    }
}



//MARK: - SelectedHeroProtocol
extension HeroesViewController: SelectedHeroProtocol {
    func selectHeroProtocol(indexPath: IndexPath) {
        let detailsHeroVC = DetailHeroViewController()
        let hero = heroes[indexPath.row]
        detailsHeroVC.hero = hero
        navigationController?.pushViewController(detailsHeroVC, animated: true)
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

