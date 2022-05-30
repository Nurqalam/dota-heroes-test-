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
        imageView.image = UIImage(named: "dota1")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Dota Heroes Library"
        label.font = .boldSystemFont(ofSize: 45)
        label.textColor = #colorLiteral(red: 0.09808254987, green: 0.26281178, blue: 0.2842366695, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let enterScrnButton: UIButton = {
        let button = UIButton()
        let color = #colorLiteral(red: 0.09808254987, green: 0.26281178, blue: 0.2842366695, alpha: 1)
        button.setTitle("Show Dota Heroes", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Book", size: 25)
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
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
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.numberOfLines = 0
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
        view.addSubview(enterScrnButton)
        view.addSubview(enterLabel)
        view.addSubview(producedLabel)
        
        enterScrnButton.addTarget(self, action: #selector(enterScrnButtonPressed), for: .touchUpInside)
    }

    @objc private func enterScrnButtonPressed() {
        let vc = UINavigationController(rootViewController: HeroesViewController())
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
            enterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            enterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            enterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45)
        ])
        
        NSLayoutConstraint.activate([
            enterScrnButton.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            enterScrnButton.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            enterScrnButton.widthAnchor.constraint(equalToConstant: 250),
            enterScrnButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            producedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            producedLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
    }
}
