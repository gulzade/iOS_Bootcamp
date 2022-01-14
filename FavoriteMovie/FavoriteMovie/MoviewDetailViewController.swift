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
    @IBOutlet weak var movieDirectorLabel: UILabel!
    
  
    var selectedMovieDirector = ""
    var selectedMovieName = ""
    var selectedMovieImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDirectorLabel.text = "Director : " +  selectedMovieDirector
        detailMovieName.text = selectedMovieName
        imageView.image = selectedMovieImage
    }
    



}
