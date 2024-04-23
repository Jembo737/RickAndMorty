//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Jemo on 23.04.24.
//

import UIKit
import ApiClient

class ViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    enum Section {
        case main
    }
    
    struct Item: Hashable {
        let id: UUID
        let name: String
    }
    
    var dataSource: DataSource!
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.cellReuseIdentifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        configureCollectionView()
        configureDataSource()
        configureSnapshot()
    }
    
    func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.cellReuseIdentifier, for: indexPath) as! CharactersCollectionViewCell
            return cell
        })
    }
    
    func configureSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems([.init(id: .init(), name: "First"), .init(id: .init(), name: "Second")], toSection: .main)
        dataSource.apply(snapshot)
    }
    
    func configureCollectionView() {
        view.addSubview(collectionView)
    }
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let padding: CGFloat = 20
        item.contentInsets = .init(top: padding, leading: padding, bottom: padding, trailing: padding)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension ViewController: UICollectionViewDelegate {
    
}
