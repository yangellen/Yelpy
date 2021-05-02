//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   @IBOutlet weak var tableView: UITableView!
   
   // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)

   var restaurantsArray: [[String:Any?]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.delegate = self
      tableView.dataSource = self

      getAPIData()

      tableView.rowHeight = 150

    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
   func getAPIData() {
      API.getRestaurants() { (restaurants) in
         guard let restaurants = restaurants else {
            return
         }

         self.restaurantsArray = restaurants
         self.tableView.reloadData() //reload data
      }
   }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return restaurantsArray.count
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
      
      let restaurant = restaurantsArray[indexPath.row]

      //set label to restaurant name for each cell
      cell.label.text = restaurant["name"] as? String ?? ""
      cell.phone.text = restaurant["phone"] as? String ?? ""



      //set image of restaurant
      if let imageUrlString = restaurant["image_url"] as? String {
         let imageUrl = URL(string: imageUrlString)
         cell.restaurantImage.af.setImage(withURL: imageUrl!)
      }
      else{
         cell.restaurantImage.image = nil
      }

      return cell
   }
}




