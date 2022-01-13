//
//  ViewController.swift
//  FavoriteMovie
//
//  Created by Gülzade Karataş 
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    

    var moviesImages = Array<UIImage>()
    var moviesNames = Array<String>()
    var chosenMovieName = ""
    var chosenMovieImage = UIImage()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView.delegate = self
        collectionView.dataSource = self
        
        moviesNames.append("Harry Potter")
        moviesNames.append("Lord of The Rings")
        moviesNames.append("Iron Man")
        moviesNames.append("Up")
        moviesNames.append("A Beautiful Mind")
        
        moviesImages.append(UIImage(named: "harrypotter.jpeg")!)
        moviesImages.append(UIImage(named: "lordoftherings.jpeg")!)
        moviesImages.append(UIImage(named: "ironman.jpeg")!)
        moviesImages.append(UIImage(named: "up.jpeg")!)
        moviesImages.append(UIImage(named: "abeautifulmind.jpeg")!)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviesNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyFavoriteMoviesViewCell
        cell.myFavoriteMovieName.text = moviesNames[indexPath.row]
        cell.myFavoriteMovieImage.image = moviesImages[indexPath.row]
        return cell
    }
    //go to details
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenMovieName = moviesNames[indexPath.row]
        chosenMovieImage = moviesImages[indexPath.row]
       performSegue(withIdentifier: "moviesDetails", sender: nil)
        }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moviesDetails" {
            let destinationVC = segue.destination as! MoviewDetailViewController
            destinationVC.selectedMovieName = chosenMovieName
            destinationVC.selectedMovieImage = chosenMovieImage
    
            }
        }

}


