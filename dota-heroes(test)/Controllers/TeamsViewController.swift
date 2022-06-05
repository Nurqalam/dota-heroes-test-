//
//  TeamsViewController.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 05.06.2022.
//

import Foundation
import UIKit


class TeamsViewController: UIViewController {
 
    private let collectionView = TeamsCollectionView(frame: .zero,
                                                      collectionViewLayout: UICollectionViewFlowLayout())
    
    var teams = [TeamModel]()
    
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
        title = "Dota Teams"
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectTeamDelegate = self
    }
}



//MARK: - URLSession
extension TeamsViewController {
    func downloadJSON(completed: @escaping () -> ()) {
        guard let url = URL(string: "https://api.opendota.com/api/teams") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil {
                if let data = data {
                    do {
                        self.teams = try JSONDecoder().decode([TeamModel].self, from: data)
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



//MARK: - UICollectionViewDataSource
extension TeamsViewController: SelectedTeamProtocol {
    func selectTeamProtocol(indexPath: IndexPath) {
        print(indexPath)
    }
}



//MARK: - UICollectionViewDataSource
extension TeamsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TeamsCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        let team = teams[indexPath.row]
        
        if let imgUrl = team.logo_url {
            cell.nameTeamLabel.text = team.name
            cell.teamImageView.downloaded(from: imgUrl)
        } else {
            cell.teamImageView.image = UIImage(named: "nologo")
        }
        return cell
    }
}



//MARK: - setConstraints
extension TeamsViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

