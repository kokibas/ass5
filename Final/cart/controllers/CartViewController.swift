import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var products = [Product]()
    let cellId="cartCellId"
    var mainDelegate:MainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.delegate=self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CartViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func appendArrAtStart(){
        products.append(Product(title: "Title 1",
                                desc: "Description 1",
                                price: 10))
        products.append(Product(title: "Title 2",
                                desc: "Description 2",
                                price: 11))
    }
}

extension CartViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! CartViewCell
        let item = products[indexPath.row]
        cell.delegate=mainDelegate
        cell.id=indexPath.row
        cell.product=item
        cell.titleLabel.text=item.title
        cell.descLabel.text=item.desc
        cell.priceLabel.text="\(item.price ?? 0)"
        return cell
    }
}
