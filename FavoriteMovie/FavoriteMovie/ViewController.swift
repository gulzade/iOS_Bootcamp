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
    var chosenMovieDirectorName = ""
    var MovieDirectorNames = Array<String>()
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
        
        
        MovieDirectorNames.append("David Yates")
        MovieDirectorNames.append("Peter Jackson")
        MovieDirectorNames.append("Jon Favreau")
        MovieDirectorNames.append("Pete Docter")
        MovieDirectorNames.append("Ron Howard")
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_:)))
            gesture.minimumPressDuration = 0.1
            collectionView.addGestureRecognizer(gesture)
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
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    //drag and drop
   //change your place
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = moviesImages.remove(at: sourceIndexPath.item)
        moviesImages.insert(item, at: destinationIndexPath.item)
    }
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        guard let collectionView = collectionView else { return }

        switch gesture.state {
        case .began:
            guard let targetIndexPath = collectionView.indexPathForItem(at: gesture .location(in: collectionView)) else { return }
            collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: collectionView))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    
    //details
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenMovieName = moviesNames[indexPath.row]
        chosenMovieImage = moviesImages[indexPath.row]
        chosenMovieDirectorName = MovieDirectorNames[indexPath.row]
       performSegue(withIdentifier: "moviesDetails", sender: nil)
        }
  
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moviesDetails" {
            let destinationVC = segue.destination as! MoviewDetailViewController
            destinationVC.selectedMovieName = chosenMovieName
            destinationVC.selectedMovieImage = chosenMovieImage
            destinationVC.selectedMovieDirector = chosenMovieDirectorName
    
            }
        }

}


