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
    
    var detailImagePath:String! = "eclipse_path"
    var detailTitle:String! = "eclipse1"
    var detailLocation:String! = "USA"
    var detailURL:String! = "https"
    var detailDetails:String! = "Eclipse Path"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailUIImage.image = UIImage(named: detailImagePath)
        detailUITitle.text = detailTitle
        detailUILocation.text = detailLocation
        detailUIURL.text = detailURL
        detailUIDetails.text = detailDetails

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
