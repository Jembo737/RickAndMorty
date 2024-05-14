//
//  CharacterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Jemo on 14.05.24.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    let vm: CharacterItemViewModel
    
    init(vm: CharacterItemViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var characterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        return image
    }()
    
    private lazy var characterName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        label.text = "Name: "
        label.textColor = .white
        
        return label
    }()
    
    private lazy var characterStatus: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.text = "Status: "
        label.textColor = .white
        
        return label
    }()
    
    private lazy var characterSpecies: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.text = "Species: "
        label.textColor = .white
        
        return label
    }()
    
    private lazy var characterGender: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.text = "Gender: "
        label.textColor = .white
        
        return label
    }()
    
    private lazy var characterOrigin: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.text = "Origin: "
        label.textColor = .white
        
        return label
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 10
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        configProperties()
    }
    
    func configView() {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStack)
        
        navigationController?.isNavigationBarHidden = false
        
        let views = [characterImage, characterName, characterStatus, characterGender, characterSpecies, characterOrigin]
        views.forEach({ mainStack.addArrangedSubview($0)})
        
        let safeView = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: safeView.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: safeView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: safeView.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: safeView.bottomAnchor)
        ])
    }
    
    func configProperties() {
        self.characterName.text! += self.vm.name
        self.characterGender.text! += self.vm.gender
        self.characterStatus.text! += self.vm.status
        self.characterSpecies.text! += self.vm.species
    }
}
