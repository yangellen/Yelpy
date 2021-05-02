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

      //set label to phone number
      cell.phone.text = restaurant["phone"] as? String ?? ""

      //set label for categories
      cell.categories.text = restaurant["price"] as? String ?? ""

      //set image for rating
      if let rating = restaurant["rating"] as? Double {

         switch rating {
         case 0:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_0")

         case 1:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_1")

         case 1.5:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_1_half")

         case 2:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_2")

         case 2.5:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_2_half")

         case 3:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_3")

         case 3.5:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_3_half")

         case 4:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_4")

         case 4.5:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_4_half")

         case 5:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_5")

         default:
            cell.ratingImage.image = #imageLiteral(resourceName: "small_0")
         }
         

      }


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




