//
//  ArticlesTableViewCell.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 11/02/2021.
//

import UIKit
import Kingfisher

class ArticlesTableViewCell: UITableViewCell {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
    
    fileprivate lazy var contentImageView: UIImageView = {
        let contentImageView = UIImageView()
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.layer.cornerRadius = 6
        contentImageView.layer.masksToBounds = true
        contentImageView.contentMode = .scaleToFill
        contentImageView.clipsToBounds = true
        return contentImageView
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        titleLabel.textColor = .white
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.backgroundColor = .clear
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentImageView.kf.cancelDownloadTask()
        contentImageView.image = nil
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            contentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            contentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            contentImageView.heightAnchor.constraint(equalToConstant: 140),
            
            titleLabel.topAnchor.constraint(equalTo: contentImageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1)
        ])
    }
    
    fileprivate func setupViews() {
        contentImageView.frame.size = CGSize(width: self.frame.width, height: 140)
        contentImageView.backgroundColor = .lightGray
        contentView.addSubview(contentImageView)
        contentView.addSubview(titleLabel)
        setupConstraints()
    }
    
    func configure(with article: Article) {
        if let media = article.media, media.count > 0 {
            let urlPath = media[0].mediaMetadata[2].url
            contentImageView.kf.setImage(with: URL(string: urlPath))
        } else {
            contentImageView.image = UIImage(named: "placeholder")
        }
        titleLabel.text = article.title
    }

}
