//
//  HomeViewController.swift
//  RizzTracker
//
//  Created by User on 4/7/23.
//

import UIKit
import ParseSwift


class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let query = Rizzults.query()
    var rizzults: [Rizzults]? = [Rizzults]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        Task {
            do {
                // todo add fetch loading
                print("Query starting ✅")
                rizzults = try? await query.findAll()
                print("Successfully Fetched ✅")
                print(rizzults)
                tableView.dataSource = self
            } catch let error {
                print("Error: ❌", error)
            }
        }
        

    }

}
extension HomeViewController: UITableViewDelegate {}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20// change to 100 rizzults?.count ?? 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! UserTableViewCell
        var index = indexPath.item
        cell.overallNameLabel.text = String( rizzults![index].owner ?? String(Int.random(in: 45...93)))
        cell.userNameLabel.text = String(rizzults![index].owner ?? "")
        return cell
    }
}

