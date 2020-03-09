//
//  DetailViewController.swift
//  NikeTest
//
//  Created by Apple on 3/4/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    let content = UIView()
    var artist: Artist?
    var genreText: String?
    
    let albumArtImageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.contentMode = .scaleAspectFit
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        return ImageView
    }()
    
    let genreLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let releaseDateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let copyRightLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let shareButton :UIButton = {
        let button = UIButton()
        button.setTitle("iTunes", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(UIColor.white, for: .normal)
        return button
        
    }()
    
    func setupTableView() {
        view.addSubview(content)
        view.addSubview(albumArtImageView)
        view.addSubview(genreLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(copyRightLabel)
        view.addSubview(shareButton)
        view.backgroundColor = .white
        content.translatesAutoresizingMaskIntoConstraints = false
        content.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        content.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        content.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        view.addConstraintWithFormat(format:"H:|-20-[v0]-20-|", views: shareButton)
        view.addConstraintWithFormat(format:"V:|-[v0(60)]-20-|", views: shareButton)
        view.addConstraintWithFormat(format:"H:|-20-[v0]-20-|", views: albumArtImageView)
        view.addConstraintWithFormat(format:"H:|-20-[v0]-20-|", views: genreLabel)
        view.addConstraintWithFormat(format:"H:|-20-[v0]-20-|", views: releaseDateLabel)
        view.addConstraintWithFormat(format:"H:|-20-[v0]-20-|", views: copyRightLabel)
        view.addConstraintWithFormat(format:"V:|-90-[v0]-8-[v1]-8-[v2]-8-[v3]-60-[v4]-|", views: albumArtImageView,genreLabel,releaseDateLabel, copyRightLabel,shareButton)

       }
    
    override func viewDidLoad() {
        setupTableView()
        navigationController?.title = "Detail"
        shareButton.addTarget(self, action: #selector(moveItune), for: .touchUpInside)
    }
    
    @objc private func moveItune() {
      let iTunesURl = "https://www.apple.com/itunes/"
        if let url = URL(string: iTunesURl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}


extension UIView {
func addConstraintWithFormat(format:String, views:UIView...) {
    var viewsDictionary = [String : UIView]()
    for(index,view) in views.enumerated(){
        let key = "v\(index)"
        viewsDictionary[key] = view
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}



