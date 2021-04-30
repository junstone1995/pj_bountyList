//
//  BountyViewController.swift
//  BountyList
//
//  Created by Junseok Lee on 2021/04/29.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let nameList = ["brook", "chopper", "franky", "luffy", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 4400000, 300000000, 16000000, 80000000, 77000000, 1200000000]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에게 데이터 주기
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

class ListCell : UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
