//
//  ViewController.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 25.05.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dota_stars")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Dota 2 Library"
        label.font = .boldSystemFont(ofSize: 55)
        label.textColor = UIColor(named: "Color-pink")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let enterHeroesScrnButton: UIButton = {
        let button = UIButton()
        let color = UIColor.white
        button.setTitle("Show Dota Heroes", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Book", size: 25)
        button.backgroundColor = #colorLiteral(red: 0.5227718566, green: 0.2400346954, blue: 0.720040909, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 4
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let enterTeamsScrnButton: UIButton = {
        let button = UIButton()
        let color = UIColor.white
        button.setTitle("Show Dota Teams", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Book", size: 25)
        button.backgroundColor = #colorLiteral(red: 0.03788266684, green: 0.5028772036, blue: 0.720040909, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 4
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let producedLabel: UILabel = {
        let label = UILabel()
        label.text = "produced by Valve 2022"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.alpha = 0.5
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(enterHeroesScrnButton)
        view.addSubview(enterTeamsScrnButton)
        view.addSubview(enterLabel)
        view.addSubview(producedLabel)
        
        enterHeroesScrnButton.addTarget(self, action: #selector(enterHeroesScrnButtonPressed), for: .touchUpInside)
        enterTeamsScrnButton.addTarget(self, action: #selector(enterTeamsScrnButtonPressed), for: .touchUpInside)
    }

    
    @objc private func enterHeroesScrnButtonPressed() {
        let vc = UINavigationController(rootViewController: HeroesViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)        
    }
    
    @objc private func enterTeamsScrnButtonPressed() {
        let vc = UINavigationController(rootViewController: TeamsViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}


// MARK: - setConstraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            enterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250),
            enterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            enterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45)
        ])
        
        NSLayoutConstraint.activate([
            enterHeroesScrnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterHeroesScrnButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            enterHeroesScrnButton.widthAnchor.constraint(equalToConstant: 250),
            enterHeroesScrnButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            enterTeamsScrnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterTeamsScrnButton.topAnchor.constraint(equalTo: enterHeroesScrnButton.bottomAnchor, constant: 25),
            enterTeamsScrnButton.widthAnchor.constraint(equalToConstant: 250),
            enterTeamsScrnButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            producedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            producedLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25)
        ])
    }
}
