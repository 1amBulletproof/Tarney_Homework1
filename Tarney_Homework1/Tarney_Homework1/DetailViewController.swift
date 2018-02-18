//
//  DetailViewController.swift
//  Tarney_Homework1
//
//  Created by Brandon Tarney on 2/13/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var detailUIImage: UIImageView!
    @IBOutlet weak var detailUITitle: UILabel!
    @IBOutlet weak var detailUILocation: UILabel!
    @IBOutlet weak var detailUIURL: UILabel!
    @IBOutlet weak var detailUIDetails: UILabel!
    
    var detailImagePath:String! = "2017-2024"
    var detailTitle:String! = "Image 1"
    var detailLocation:String! = "North America"
    var detailURL:String! = "http://eclipse.siu.edu/about/carbondale-and-the-solar-eclipse/"
    var detailDetails:String! = "The paths of the 2017 and 2024 solar eclipses."

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailUIImage.image = UIImage(named: detailImagePath)
        
        detailUITitle.text = detailTitle
        detailUILocation.text = detailLocation
        detailUIURL.text = detailURL
        detailUIDetails.text = detailDetails

    }

}
