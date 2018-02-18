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
    
    /* TEST DATA (prior to JSON parsing)
    let images = ["2017-2024", "grey_sun", "moon_and_sun", "orange_sun", "space", "sun_array"]
    let appTitle = "Eclipse 2017 Images"
    let names = ["eclipse1", "eclipse2", "eclipse3", "eclipse4", "eclipse5", "eclipse6"]
    let locations = ["USA", "CUBA", "RUSSIA", "CHINA", "MOON", "GALAXY"]
    let descriptions = ["Eclipse Path", "Grey Sun", "Moon and Sun", "Orange Sun", "Space", "Sun array"]
    let urls = ["https", "https", "https", "https", "https", "https"]
     */
    
    var jsonEclipseData: EclipseData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        jsonEclipseData = EclipseData(jsonFilePath: "eclipse.json")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return jsonEclipseData.data.images.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "embeddedTableViewCell", for: indexPath)
        //TODO: make UIIMage in cell all same dimensions!
        cell.imageView!.image = UIImage(named: jsonEclipseData.data.images[indexPath.row].image)
        cell.textLabel!.text = jsonEclipseData.data.images[indexPath.row].name
        cell.detailTextLabel!.text = jsonEclipseData.data.images[indexPath.row].location
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    //Handle segue to detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!

        let row = indexPath.row
        let viewController = segue.destination as! DetailViewController

        viewController.detailImagePath = jsonEclipseData.data.images[row].image
        viewController.detailTitle = jsonEclipseData.data.images[row].name
        viewController.detailLocation = jsonEclipseData.data.images[row].location
        viewController.detailURL = jsonEclipseData.data.images[row].url
        viewController.detailDetails = jsonEclipseData.data.images[row].description
    }
}

