//
//  SeatCollectionViewController.swift
//  blueHouse
//
//  Created by Samantha Yang on 2/17/19.
//  Copyright © 2019 theswiftproject. All rights reserved.
//

import UIKit

var seatArray: [Seat] = {
    var arr = [Seat]()
    for i in 0..<20 {
        arr.append(Seat())
    }
    return arr
}()



class SeatCollectionViewController: UICollectionViewController {

    var cameFromSignIn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return seatArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatCollectionCell", for: indexPath) as! SeatCollectionViewCell
        let seat = seatArray[indexPath.row]
        
        // Configure the cell
        if seat.checkIsOccupied() == true {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .green
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        var initialCondition = seatArray[index].checkIsOccupied()
        if cameFromSignIn == true {
            seatArray[index].startReservation(UID: "983787e8ueyu")
        }
        else{
            seatArray[index].signout(UID: "983787e8ueyu")
        }
        if let cell = collectionView.cellForItem(at: indexPath) as? SeatCollectionViewCell {
            let seat = seatArray[indexPath.row]
            if seat.checkIsOccupied() == true {
                cell.backgroundColor = .red
            } else {
                cell.backgroundColor = .green
            }
        }
        if cameFromSignIn == true && seatArray[index].checkIsOccupied() == true && initialCondition == false
        {// Make alert of signing in successfully
            let alertController = UIAlertController(title: "Congratulations", message: "Reserved successfully!\nPlease Tap 'Back'", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style:.default , handler: { (_) in print("")
                // Code to execute when user taps this button
                
            }))

            DispatchQueue.main.async {
                self.present(alertController, animated: true, completion: nil)
            }
        }
    
        if cameFromSignIn == false && seatArray[index].checkIsOccupied() == false && initialCondition == true
        {// Make alert of signing out successfully
            let alertController = UIAlertController(title: "Congratulations", message: "You are all set!\nPlease Tap 'Back'", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style:.default , handler: { (_) in print("")
                // Code to execute when user taps this button
                
            }))
            
            DispatchQueue.main.async {
                self.present(alertController, animated: true, completion: nil)
            }
            
        }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    
}
}
