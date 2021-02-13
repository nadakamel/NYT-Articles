//
//  ArticleDetailsView.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 12/02/2021.
//

import UIKit

class ArticleDetailsView: UIView {

    fileprivate let viewTopMargin: CGFloat = 100.0
    fileprivate let sideMargin: CGFloat = 20.0
    
    fileprivate lazy var contentImageView: UIImageView = {
        let contentImageView = UIImageView()
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.layer.cornerRadius = 6
        contentImageView.layer.masksToBounds = true
        contentImageView.contentMode = .scaleToFill
        contentImageView.clipsToBounds = true
        return contentImageView
    }()
    
    fileprivate lazy var copyrightLabel: UILabel = {
        let copyrightLabel = UILabel()
        copyrightLabel.numberOfLines = 0
        copyrightLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        copyrightLabel.textColor = .systemGray
        copyrightLabel.lineBreakMode = .byWordWrapping
        copyrightLabel.backgroundColor = .clear
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        return copyrightLabel
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.backgroundColor = .clear
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    fileprivate lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.textColor = .white
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    fileprivate lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.numberOfLines = 0
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        dateLabel.textColor = .systemGray
        dateLabel.lineBreakMode = .byWordWrapping
        dateLabel.backgroundColor = .clear
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupViewsConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: viewTopMargin),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideMargin),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -sideMargin),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideMargin),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -sideMargin),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideMargin),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -sideMargin),
            dateLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
            
            contentImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            contentImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideMargin),
            contentImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -sideMargin),
            
            copyrightLabel.topAnchor.constraint(equalTo: contentImageView.bottomAnchor, constant: 7),
            copyrightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: sideMargin),
            copyrightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -sideMargin),
            copyrightLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
        ])
    }
    
    private func setupUI() {
        contentImageView.frame.size = CGSize(width: self.frame.width, height: 180)
        [titleLabel, descriptionLabel, dateLabel, contentImageView, copyrightLabel].forEach {
            self.addSubview($0)
        }
        setupViewsConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateViews(withArticle article: Article?) {
        if let media = article?.media, media.count > 0 {
            let urlPath = media[0].mediaMetadata[2].url
            contentImageView.kf.setImage(with: URL(string: urlPath))
            copyrightLabel.text = "© \(media[0].copyright)"
        }
        titleLabel.text = article?.title
        descriptionLabel.text = article?.abstract
        dateLabel.text = "Published at \(article?.publishedDate ?? "")\nUpdated at \(article?.updated ?? "")"
    }
    
    
}
