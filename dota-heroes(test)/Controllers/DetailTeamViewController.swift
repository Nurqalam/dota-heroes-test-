//
//  DetailTeamViewController.swift
//  dota-teames(test)
//
//  Created by Nurqalam on 05.06.2022.
//

import Foundation
import UIKit

class DetailTeamViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 10
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let teamRatingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let teamWinsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let teamLosesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var stackView = UIStackView()
    var team: TeamModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupViews()
        setteamDetails()
        setConstraints()
    }
    
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(teamImageView)
        view.addSubview(teamNameLabel)
        
        stackView = UIStackView(arrangedSubviews: [teamRatingLabel,
                                                   teamWinsLabel,
                                                   teamLosesLabel],
                                axis: .vertical,
                                spacing: 20,
                                distribution: .fillEqually)

        view.addSubview(stackView)
    }
    
    
    private func setteamDetails() {
        guard let team = team else {
            return
        }
        teamNameLabel.text = team.name
        teamRatingLabel.text = "Team Rating: \(team.rating)"
        teamLosesLabel.text = "Team Loses: \(team.losses)"
        teamWinsLabel.text = "Team Wins: \(team.wins)"

        let nologo = "https://yt3.ggpht.com/ytc/AKedOLS684LcSvl5yHXhtJMoAYRF3WTfqBJVYdBidBgw=s900-c-k-c0x00ffffff-no-rj"

        if let imgUrl = team.logo_url {
            teamImageView.downloaded(from: imgUrl)
            teamImageView.contentMode = .scaleAspectFit
        } else {
            teamImageView.downloaded(from: nologo)
        }
    }
}



//MARK: - setConstraints()
extension DetailTeamViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            teamImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            teamImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            teamImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            teamImageView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            teamNameLabel.topAnchor.constraint(equalTo: teamImageView.bottomAnchor, constant: 35),
            teamNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 65),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
        ])
    }
}
