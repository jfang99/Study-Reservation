//
//  ViewController.swift
//  blueHouse
//
//  Created by Samantha Yang on 2/17/19.
//  Copyright © 2019 theswiftproject. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SeatCollectionViewController {
            if segue.identifier == "signIn" {
                destination.cameFromSignIn = true
            } else if segue.identifier == "signOut" {
                destination.cameFromSignIn = false
            }
        }
        
        super.prepare(for: segue, sender: sender)
    }
   


    
}










