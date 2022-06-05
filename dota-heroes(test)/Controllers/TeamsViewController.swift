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
        
        let rightBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.uturn.backward.circle.fill"),
                                       style: .plain,
                                       target: self,
                                       action: #selector(exitButtonPressed))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectTeamDelegate = self
    }
    
    @objc private func exitButtonPressed() {
        let vc = UINavigationController(rootViewController: MainViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
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
        let detailsTeamVC = DetailTeamViewController()
        let team = teams[indexPath.row]
        detailsTeamVC.team = team
        navigationController?.pushViewController(detailsTeamVC, animated: true)
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
        let nologo = "https://yt3.ggpht.com/ytc/AKedOLS684LcSvl5yHXhtJMoAYRF3WTfqBJVYdBidBgw=s900-c-k-c0x00ffffff-no-rj"
        
        if let imgUrl = team.logo_url {
            cell.nameTeamLabel.text = team.name
            cell.teamImageView.downloaded(from: imgUrl)
        } else {
            cell.teamImageView.downloaded(from: nologo)
            cell.nameTeamLabel.text = "No name"
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

