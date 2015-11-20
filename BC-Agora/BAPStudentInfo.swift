class CustomCell : UITableViewCell,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var label: UILabel!
    var data :[AnyObject]!
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("innerCell") as UITableViewCell;
        cell.textLabel.text = "\(data[indexPath.row])"
        return cell
    }
}

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var Item1 = ["Item1","Item1","Item1","Item1"]
    var Item2 = ["Item2","Item2","Item2","Item2"]
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return Item1.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as CustomCell
        
        cell.label.text = Item1[indexPath.row]
        cell.data = Item2;
        
        return cell
    }
}