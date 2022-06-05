//
//  TeamsCollectionViewCell.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 05.06.2022.
//

import Foundation
import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    let teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameTeamLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 12
        
        addSubview(teamImageView)
        addSubview(nameTeamLabel)
    }
}


//MARK: - setConstraints()
extension TeamsCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            teamImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            teamImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            teamImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            teamImageView.heightAnchor.constraint(equalToConstant: 115)
        ])
        
        NSLayoutConstraint.activate([
            nameTeamLabel.topAnchor.constraint(equalTo: teamImageView.bottomAnchor, constant: 5),
            nameTeamLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            nameTeamLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
