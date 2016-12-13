//
//  UsersVC.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 12/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UsersVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    private var users = [User]()
    private var selectedUsers = Dictionary<String, User>()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        
        DataService.instance.usersReference.observeSingleEvent(of: .value) { (snapshot: FIRDataSnapshot) in
            
            if let users = snapshot.value as? Dictionary<String, Any> {
                
                for (key, value) in users {
                    
                    if let dict = value as? Dictionary<String, Any> {
                        if let profile = dict["profile"] as? Dictionary<String, Any>{
                            if let firstName = profile["firstName"] as? String, let lastName = profile["lastName"] as? String {
                                let uid = key
                                let user = User(uid: uid, firstName: firstName, lastName: lastName)
                                self.users.append(user)
                            }
                        }
                    }
                }
            }
            self.tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell
        let user = users[indexPath.row]
        cell.updateUserUI(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        cell.setCheckMark(selected: true)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = user
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        cell.setCheckMark(selected: false)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = nil
    }


}
