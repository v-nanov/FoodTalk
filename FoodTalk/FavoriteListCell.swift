//
//  FavoriteListCell.swift
//  FoodTalk
//
//  Created by Atousa Duprat on 4/23/16.
//  Copyright © 2016 EricDHong. All rights reserved.
//

import UIKit

class FavoriteListCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nameOfRestaurant: UILabel!
    
    @IBOutlet weak var myRatingImage: UIImageView!
    
    @IBOutlet weak var adressTextView: UITextView!
    
    @IBOutlet private weak var notesTableView: UITableView!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    var restaurant : Restaurant!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupNotesTableView()
    }
    
    func setupNotesTableView()
    {
        notesTableView.delegate = self
        notesTableView.dataSource = self
        self.addSubview(notesTableView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        notesTableView.frame = CGRectMake(0.2, 0.3, self.bounds.size.width-5, self.bounds.size.height-5)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (restaurant == nil) {
            return 0
        }
        
        return (restaurant.visits?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NotesCell") as! FavoriteListCellNotesSubCell
        
        let visit = restaurant.visits?.allObjects[indexPath.row] as! Visit

        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //  "yyyy-MM-dd HH:mm:ss ZZZ"

        //cell.textLabel?.text = "Row " + String(indexPath.row)
        if (visit.date != nil) {
            cell.dateLabel?.text = dateFormatter.stringFromDate(visit.date!)
        } else {
            cell.dateLabel?.text = ""
        }
        cell.noteLabel?.text = visit.notes
        return cell
    }
}
