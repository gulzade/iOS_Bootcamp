//
//  MoviewDetailViewController.swift
//  FavoriteMovie
//
//  Created by Gülzade Karataş
//

import UIKit

class MoviewDetailViewController: UIViewController {

    @IBOutlet weak var detailMovieName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedMovieName = ""
    var selectedMovieImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailMovieName.text = selectedMovieName
        imageView.image = selectedMovieImage
    }
    



}
