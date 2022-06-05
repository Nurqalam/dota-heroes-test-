//
//  DetailHeroViewController.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 04.06.2022.
//

import Foundation
import UIKit

class DetailHeroViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 10
        imageView.layer.borderColor = UIColor.white.cgColor
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
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroAttackTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroAttackRangeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroHealthLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let heroManaLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var stackView = UIStackView()
    var hero: HeroModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupViews()
        setHeroDetails()
        setConstraints()
        setBackgroundImages()
    }
    
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
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
        heroImageView.layer.cornerRadius = 160
    }
    
    private func setBackgroundImages() {
        guard let hero = hero else {
            return
        }

        if hero.primary_attr == "int" {
            backgroundImageView.image = UIImage(named: "violet")
            heroImageView.layer.borderColor = #colorLiteral(red: 0.6498096366, green: 0.6673937673, blue: 0.9334683165, alpha: 1)
        } else if hero.primary_attr == "agi" {
            backgroundImageView.image = UIImage(named: "green")
            heroImageView.layer.borderColor = #colorLiteral(red: 0.7425151357, green: 1, blue: 0.6936302665, alpha: 1)
        } else if hero.primary_attr == "str" {
            backgroundImageView.image = UIImage(named: "red")
            heroImageView.layer.borderColor = #colorLiteral(red: 0.774218935, green: 0.2002253219, blue: 0.1581920951, alpha: 1)
        } else {
            heroImageView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}



//MARK: - setConstraints()
extension DetailHeroViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            heroImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            heroImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            heroImageView.heightAnchor.constraint(equalToConstant: 320)
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
