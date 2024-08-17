//
//  CellCollectionView.swift
//  ControleDeGastos
//
//  Created by Joao on 27/07/24.
//

import Foundation
import UIKit

class CellViewConfig: UICollectionViewCell {
    
    //static let identifier: String = "CustomCellCollectionView"
   /*
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    */
    
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView 
    }()

    private let iconImageCell: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        
        contentView.addSubview(iconImageCell)
        iconImageCell.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            iconImageCell.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImageCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageCell.heightAnchor.constraint(equalToConstant: 60),
            iconImageCell.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configure(with iconImage: UIImage?, backgroundImage: UIImage?) {
        iconImageCell.image = iconImage
        backgroundImageView.image = backgroundImage
        
        
    }
}
