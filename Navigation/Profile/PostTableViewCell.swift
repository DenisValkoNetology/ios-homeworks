//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Денис Валько on 24.02.2025.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var author: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var descripion: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    var likes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    var views: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(author)
        contentView.addSubview(image)
        contentView.addSubview(descripion)
        contentView.addSubview(likes)
        contentView.addSubview(views)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            author.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            author.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            author.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            image.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 12),
            
            descripion.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            descripion.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descripion.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likes.topAnchor.constraint(equalTo: descripion.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            views.topAnchor.constraint(equalTo: descripion.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            views.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func fillPost(post: postModel) {
        author.text = post.author
        descripion.text = post.description
        image.image = UIImage(named: post.image)
        likes.text = "Likes: \(post.likes)"
        views.text = "Views: \(post.views)"
    }
}
