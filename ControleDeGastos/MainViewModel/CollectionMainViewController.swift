//
//  CollectionMainViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 06/07/24.
//

import Foundation
import UIKit

class CollectionMainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lista de Contas"
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 170, height: 200)//Informa o tamanho da célula na grade
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)//informa a distância entre as células da grade
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .lightGray
        collectionView.layer.cornerRadius = 10
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //Registrar a célular personalizada
        collectionView.register(CellViewConfig.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    //MARK: - UICollectionDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellViewConfig
        //cell.configure(with: "Item \(indexPath.item)", imageName: "Image \(indexPath.item)")
        
        cell.backgroundColor = .yellow
        
        let iconImageCell: UIImage?
        let backgroundImage: UIImage?
        
        switch indexPath.item {
        case 0:
            iconImageCell = UIImage(named: "light_bill")
            backgroundImage = UIImage(named: "light_backgorund")
        case 1:
            iconImageCell = UIImage(named: "water_bill")
            backgroundImage = UIImage(named: "water_background")
        case 2:
            iconImageCell = UIImage(named: "internet_bill")
            backgroundImage = UIImage(named: "internet_background")
        case 3:
            iconImageCell = UIImage(named: "cellphone_bill")
            backgroundImage = UIImage(named: "cellphone_background")
        default:
            iconImageCell = nil
            backgroundImage = nil
        }
        cell.configure(with: iconImageCell, backgroundImage: backgroundImage)
        
        return cell
    }
        

    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Clique da célula
        print("célula clicada \(indexPath.item)")
        let detailcellViewController = DetailViewViewController()
        detailcellViewController.selectedItemIndex = indexPath.item
        navigationController?.pushViewController(detailcellViewController, animated: true)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
}

