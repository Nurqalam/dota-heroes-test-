//
//  DetailHeroViewController.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 04.06.2022.
//

import Foundation
import UIKit

class DetailHeroViewController: UIViewController {

    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let heroNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroAttributeLabel: UILabel = {
        let label = UILabel()
        label.text = "HERO Atribute"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroAttackTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "HERO Attack type"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroAttackRangeLabel: UILabel = {
        let label = UILabel()
        label.text = "HERO Attack type"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroHealthLabel: UILabel = {
        let label = UILabel()
        label.text = "HERO health"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let heroManaLabel: UILabel = {
        let label = UILabel()
        label.text = "HERO mana"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var stackView = UIStackView()
    var hero: HeroModel?
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.heroImageView.layer.cornerRadius = heroImageView.frame.height / 2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupViews()
        setHeroDetails()
        setConstraints()
    }
    
    
    private func setupViews() {

        view.addSubview(heroImageView)
        view.addSubview(heroNameLabel)
        
        stackView = UIStackView(arrangedSubviews: [heroAttributeLabel,
                                                   heroAttackTypeLabel,
                                                   heroAttackRangeLabel,
                                                   heroHealthLabel,
                                                   heroManaLabel],
                                axis: .vertical,
                                spacing: 20,
                                distribution: .fillEqually)

        view.addSubview(stackView)
    }
    
    
    private func setHeroDetails() {
        guard let hero = hero else {
            print("wrong")
            return
        }
        heroNameLabel.text = hero.localized_name
        heroAttributeLabel.text = "Hero Attribute: \(String(describing: hero.primary_attr))"
        heroAttackRangeLabel.text = "Hero Attack Range: \(String(describing: hero.attack_range))"
        heroAttackTypeLabel.text = "Hero Attack Type: \(String(describing: hero.attack_type))"
        heroHealthLabel.text = "Hero Heatlh: \(String(describing: hero.base_health))"
        heroManaLabel.text = "Hero Mana: \(String(describing: hero.base_mana))"
        
        let imgUrl = "https://api.opendota.com" + (hero.img )
        heroImageView.downloaded(from: imgUrl)
        heroImageView.contentMode = .scaleToFill
        
        
        if hero.primary_attr == "int" {
            view.backgroundColor = #colorLiteral(red: 0.6498096366, green: 0.6673937673, blue: 0.9334683165, alpha: 1)
        } else if hero.primary_attr == "agi" {
            view.backgroundColor = #colorLiteral(red: 0.7425151357, green: 1, blue: 0.6936302665, alpha: 1)
        } else if hero.primary_attr == "str" {
            view.backgroundColor = #colorLiteral(red: 0.774218935, green: 0.2002253219, blue: 0.1581920951, alpha: 1)
        } else {
            view.backgroundColor = .white
        }
    }
}


//MARK: - setConstraints()
extension DetailHeroViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            heroImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            heroImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            heroImageView.heightAnchor.constraint(equalToConstant: 340)
        ])
        
        NSLayoutConstraint.activate([
            heroNameLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 35),
            heroNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: heroNameLabel.bottomAnchor, constant: 65),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
        ])
    }
}
