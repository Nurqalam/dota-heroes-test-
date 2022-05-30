//
//  HeroesViewControllerCell.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 30.05.2022.
//

import Foundation
import UIKit

class HeroesViewControllerCell: UITableViewCell {
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameAlbumLabel: UILabel = {
        let label = UILabel()
        label.text = "Name album name"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameArtisLabel: UILabel = {
        let label = UILabel()
        label.text = "Name artis name"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOftracksLabel: UILabel = {
        let label = UILabel()
        label.text = "16 tracks"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private var stackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        albumImageView.layer.cornerRadius = albumImageView.frame.width / 2
    }
    
    
    private func setupViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        stackView = UIStackView(arrangedSubviews: [nameArtisLabel,
                                                  numberOftracksLabel],
                                axis: .horizontal,
                                spacing: 20,
                                distribution: .equalSpacing)
        
        addSubview(albumImageView)
        addSubview(nameAlbumLabel)
        addSubview(stackView)
        
    }
    
        
        
            
    private func setConstraints() {
        NSLayoutConstraint.activate([
            albumImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            albumImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            albumImageView.heightAnchor.constraint(equalToConstant: 60),
            albumImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            nameAlbumLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 25),
            nameAlbumLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            nameAlbumLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 25),
            stackView.topAnchor.constraint(equalTo: nameAlbumLabel.bottomAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25)
        ])
    }
}
