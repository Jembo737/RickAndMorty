//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Jemo on 23.04.24.
//

import UIKit

class CharactersViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, CharacterItemViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, CharacterItemViewModel>
    
    enum Section {
        case main
    }
    
    var dataSource: DataSource!
    var vm: CharactersViewModel
    
    init(vm: CharactersViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.cellReuseIdentifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        configureCollectionView()
        configureDataSource()
        Task {
            await vm.fetchCharacters()
            updateSnapshot(with: vm.characters)
        }
        
    }
    
    func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, character in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.cellReuseIdentifier, for: indexPath) as! CharactersCollectionViewCell
            cell.configure(with: character)
            return cell
        })
    }
    
    func updateSnapshot(with item: [CharacterItemViewModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(item, toSection: .main)
        dataSource.apply(snapshot)
    }
    
    func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .estimated(400))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let padding: CGFloat = 0
        item.contentInsets = .init(top: padding, leading: padding, bottom: padding, trailing: padding)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(400))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(16)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension CharactersViewController: UICollectionViewDelegate {

}
