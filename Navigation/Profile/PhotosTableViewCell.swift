//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Денис Валько on 24.02.2025.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()

    var arrowImg: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        return image
    }()

    var stackImage: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setImages()
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(title)
        contentView.addSubview(arrowImg)
        contentView.addSubview(stackImage)
    }
    
    private func setImages() {
        for i in 1...4 {
            let photoView = UIImageView()
            let photo = UIImage(named: "\(i)")
            photoView.image = photo
            photoView.translatesAutoresizingMaskIntoConstraints = false
            photoView.contentMode = .scaleAspectFill
            photoView.layer.cornerRadius = 6
            photoView.clipsToBounds = true
            stackImage.addArrangedSubview(photoView)
            NSLayoutConstraint.activate([
                photoView.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 24) / 4),
                photoView.heightAnchor.constraint(equalTo: photoView.widthAnchor)
            ])
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            arrowImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowImg.centerYAnchor.constraint(equalTo: title.centerYAnchor),

            stackImage.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            stackImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }
}
