//
//  EclipseData.swift
//  Tarney_Homework1
//
//  Created by Brandon Tarney on 2/17/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//

import UIKit
import Foundation

struct EclipseImageDataStruct: Codable {
    var name: String
    var location: String
    var description: String
    var url: String
    var image: String
}

struct EclipseDataStruct: Codable {
    var title: String
    var images: [EclipseImageDataStruct]
}

class EclipseData {
    
    var data: EclipseDataStruct!

    func parseJson(jsonFilePath: String) {
        //Setup File Name stuff
        let jsonFilePathArray = jsonFilePath.split(separator: ".")
        let jsonFileName = String(jsonFilePathArray[0])
        let jsonFileNameExtension = String(jsonFilePathArray[1])
        
        //Get a handle on the actual JSON Resource passed-in
        let url = Bundle.main.url(
            forResource: jsonFileName,
            withExtension: jsonFileNameExtension)!
        let jsonFileData = try! Data(contentsOf: url)
        
        //Decode the JSON data into our handy-dandy struct
        let decoder = JSONDecoder()
        do {
            data = try decoder.decode(EclipseDataStruct.self, from: jsonFileData)
        } catch {
            print("could not decode json data")
        }
    }
}
