//
//  ViewController.swift
//  NikeTest
//
//  Created by Apple on 3/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

 class ViewController: UIViewController {
    let cellId = "cellId"
    var artists: [Artist]?
    var cacheImage = [Int: UIImage]()

    let tableView = UITableView()
      
    override func loadView() {
        super.loadView()
        DispatchQueue.global().async {
            self.fetchData()
        }
        setupTableView()
      }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
              // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func fetchData() {
        ContentService().getAlbumData { [weak self] (result)  in
            guard let strongSelf = self else { return }
            guard case .success(let data) = result else { return }
            self?.artists = data
                   DispatchQueue.main.async {
                        strongSelf.tableView.reloadData()
                   }
            }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let artistCount = artists?.count else { return 0 }
        return artistCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = artists![indexPath.row].name
        cell.detailTextLabel?.text = artists![indexPath.row].artistName
        DispatchQueue.global().async {
            let imageURL = URL(string: self.artists![indexPath.row].artworkUrl100)
            let imageData = NSData(contentsOf: imageURL!)
            let image = UIImage(data: imageData! as Data)
            self.cacheImage[indexPath.row] = image
            DispatchQueue.main.async {
                tableView.beginUpdates()
                cell.imageView?.image = image
                tableView.endUpdates()
            }
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.artist = artists?[indexPath.row]
        detailVC.albumArtImageView.image = cacheImage[indexPath.row]
        artists?[indexPath.row].genres.forEach { genre in
            detailVC.genreLabel.text = genre.name
        }
        detailVC.releaseDateLabel.text = artists?[indexPath.row].releaseDate
        detailVC.copyRightLabel.text = artists?[indexPath.row].copyright
        navigationController?.pushViewController(detailVC, animated: true)
    }
}




