//
//  CharactersCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Jemo on 23.04.24.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    static let cellReuseIdentifier = "Cell"
    
    private var characterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .red
        return image
    }()
    
    private let characterName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Test"
        return label
    }()
    
    private let characterStatus: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.alpha = 0.5
        label.text = "Status"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        contentView.addSubview(characterImage)
        contentView.addSubview(characterName)
        contentView.addSubview(characterStatus)
        
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterStatus.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterImage.widthAnchor.constraint(equalTo: characterImage.heightAnchor, multiplier: 4/5),
            
            characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 10),
            characterName.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor),
            characterName.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor),
            characterName.heightAnchor.constraint(equalToConstant: 30),
            
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 10),
            characterStatus.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor),
            characterStatus.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor),
            characterStatus.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
