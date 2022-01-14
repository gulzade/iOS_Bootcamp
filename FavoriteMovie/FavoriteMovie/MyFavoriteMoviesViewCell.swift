//
//  MyFavoriteMoviesViewCell.swift
//  FavoriteMovie
//
//  Created by Gülzade Karataş 
//

import UIKit

class MyFavoriteMoviesViewCell: UICollectionViewCell {
    @IBOutlet weak var myFavoriteMovieImage: UIImageView!
    @IBOutlet weak var myFavoriteMovieName: UILabel!
    @IBOutlet var starButtons: [UIButton]!
    @IBAction func buttonTrapped(_ sender: UIButton) {
        print("trapped")
        for  button in starButtons {
                 if button.tag <= sender.tag {  print("trapped1")
                     print(button.tag , sender.tag)
                     button.backgroundColor = UIColor.yellow
                    // button.setBackgroundImage(UIImage(named: "starSelected.png"), for: .normal)
    
                 } else {  print("else")
                     print(button.tag , sender.tag)
                     button.backgroundColor = UIColor.white
                  //   button.setBackgroundImage(UIImage.init(named: "star.png"), for: .normal)    //not selectted
                 }
            
             }
             
  }
    
  
    
}
