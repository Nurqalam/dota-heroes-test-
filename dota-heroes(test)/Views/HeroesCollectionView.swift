//
//  HeroesCollectionView.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 04.06.2022.
//

import Foundation
import UIKit

protocol SelectedHeroProtocol: AnyObject {
    func selectHeroProtocol(indexPath: IndexPath)
}


class HeroesCollectionView: UICollectionView {
    
    weak var selectHeroDelegate: SelectedHeroProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        register(HeroesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}


//MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension HeroesCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectHeroDelegate?.selectHeroProtocol(indexPath: indexPath)
    }
}


extension HeroesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 5,
                      height: 150)
    }
}
