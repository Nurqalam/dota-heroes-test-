//
//  TeamsCollectionView.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 05.06.2022.
//

import Foundation
import UIKit

protocol SelectedTeamProtocol: AnyObject {
    func selectTeamProtocol(indexPath: IndexPath)
}


class TeamsCollectionView: UICollectionView {
    
    weak var selectTeamDelegate: SelectedTeamProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        register(TeamsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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
extension TeamsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectTeamDelegate?.selectTeamProtocol(indexPath: indexPath)
    }
}


extension TeamsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 5,
                      height: 150)
    }
}
