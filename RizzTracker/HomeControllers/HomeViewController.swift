//
//  HomeViewController.swift
//  RizzTracker
//
//  Created by User on 4/7/23.
//

import UIKit
import ParseSwift

// TODO: Fix teh damn index shit



class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let query = Rizzults.query()
    var rizzults: [Rizzults] = [
        Rizzults(
        owner: "None",
        objectID: "None",
        badsQuantity: -1,
        wantMeFrFRQuantity: -1,
        goingToTalkToQuantity: -1,
        numberComunications: -1,
        descriptionOfSituation: "None"
    ),
        Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        ),Rizzults(
            owner: "None",
            objectID: "None",
            badsQuantity: -1,
            wantMeFrFRQuantity: -1,
            goingToTalkToQuantity: -1,
            numberComunications: -1,
            descriptionOfSituation: "None"
        )
    ]
    var overalls: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // TODO: figure out all the data fetching
        Task {
            do {
                // todo add fetch loading
                print("Query starting ✅")
                let data = try await query.findAll()
                DispatchQueue.main.async {
                    // Set the view controller's tracks property as this is the one the table view references
                    self.rizzults = data
                    //print(self?.Movies)
                    // Make the table view reload now that we have new data
                    self.tableView.reloadData()
                }
                print("Successfully Fetched ✅")
            } catch let error {
                print("Error: ❌", error)
            }
        }
    }
    
}
extension HomeViewController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "DetailViewSegue", let destination = segue.destination as? DetailViewController, let index = tableView.indexPathForSelectedRow?.item {
            destination.rizzult = rizzults[index]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Bruh")
        performSegue(withIdentifier: "DetailViewSegue", sender: (Any).self)
        print("Selected Row at \(indexPath.item)")
        
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rizzults.count ?? 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! UserTableViewCell
        var index = indexPath.item
        cell.overallNameLabel.text = String(rizzults[index].ownerRizz ?? -1)
        cell.userNameLabel.text = String( rizzults[index].owner ?? String(-1))
        print("INDEX: ", index)
        return cell
    }
}

