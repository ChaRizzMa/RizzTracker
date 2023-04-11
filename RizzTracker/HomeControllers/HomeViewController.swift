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
    var rizzults: [Rizzults]! = []
    var usernames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        Task {
            do {
                // todo add fetch loading
                print("Query starting ✅")
                rizzults = try? await query.findAll()
                print("Successfully Fetched ✅")
                // print(rizzults)
                tableView.dataSource = self
            } catch let error {
                print("Error: ❌", error)
            }
        }
        
        for r in rizzults {
            usernames.append(String(r.owner ?? "NO USER"))
        }
        
        print(usernames)

    }

}
extension HomeViewController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "DetailViewSegue", let destination = segue.destination as? DetailViewController, let index = tableView.indexPathForSelectedRow?.item {
            destination.rizzult = rizzults![index]
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
        return 20// change to 100 rizzults?.count ?? 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! UserTableViewCell
        var index = indexPath.row
        cell.overallNameLabel.text = String(Int.random(in: 20...93))
        cell.userNameLabel.text = "" // Fix this
        return cell
    }
}

