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
        image.layer.cornerRadius = 20
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.green.cgColor
        image.clipsToBounds = true
        
        return image
    }()
    
    private let characterName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Test"
        label.textColor = .green
        
        return label
    }()
    
    private let characterStatus: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.alpha = 0.5
        label.text = "Status"
        label.textColor = .green
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterStatus.textColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
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
            characterImage.heightAnchor.constraint(equalToConstant: 150),
            
            characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 10),
            characterName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 10),
            characterStatus.leadingAnchor.constraint(equalTo: characterImage.leadingAnchor),
            characterStatus.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor),
            characterStatus.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    func configure(with model: CharacterItemViewModel) {
        self.characterName.text = model.name
        self.characterStatus.text = model.status
        
        if characterStatus.text == Status.dead.rawValue {
            characterStatus.textColor = .red
        } else if characterStatus.text == Status.unknown.rawValue {
            characterStatus.textColor = .gray
        }
    }
    
    func setImage(image: UIImage) {
        characterImage.image = image
    }
    
    func takeImage() -> UIImage? {
        self.characterImage.image
    }
}
