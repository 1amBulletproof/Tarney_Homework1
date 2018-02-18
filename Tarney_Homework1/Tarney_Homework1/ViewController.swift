//
//  ViewController.swift
//  Tarney_Homework1
//
//  Created by Brandon Tarney on 2/11/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //TEST IPAD WAS HERE! MUAHAHA
    //TODO: import OG images & use JSON image name, not this fake array
    let images = ["2017-2024", "grey_sun", "moon_and_sun", "orange_sun", "space", "sun_array"]
    let appTitle = "Eclipse 2017 Images"
    let names = ["eclipse1", "eclipse2", "eclipse3", "eclipse4", "eclipse5", "eclipse6"]
    let locations = ["USA", "CUBA", "RUSSIA", "CHINA", "MOON", "GALAXY"]
    let descriptions = ["Eclipse Path", "Grey Sun", "Moon and Sun", "Orange Sun", "Space", "Sun array"]
    let urls = ["https", "https", "https", "https", "https", "https"]
    
    var jsonEclipseData: EclipseData!
    
    //TODO: insert images into every cell -> cell.imageView!.image = UIImage(named: imgName)
    
    //TODO: make image-in-cells proper height
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        jsonEclipseData.parseJson(jsonFilePath: "eclipse.json")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return names.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "embeddedTableViewCell", for: indexPath)
        cell.imageView!.image = UIImage(named: images[indexPath.row])
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    //Handle segue to detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
//        let section = indexPath.section
        let row = indexPath.row
        let viewController = segue.destination as! DetailViewController
        
        //TODO: use jsonEclipseData instead
        viewController.detailImagePath = images[row]
        viewController.detailTitle = names[row]
        viewController.detailLocation = locations[row]
        viewController.detailURL = urls[row]
        viewController.detailDetails = descriptions[row]
        
    }

}

