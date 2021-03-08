import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet   var cartBtn: UIButton!
    @IBOutlet   var radioBtn: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    var cartProducts = [Product]()
    let cellId="cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendArrAtStart()
        
        //collection
        collectionView.isHidden=true
        
        let layout=UICollectionViewFlowLayout()
        layout.itemSize=CGSize(width: 200, height: 150)
        collectionView.collectionViewLayout=layout
        collectionView.delegate=self
        collectionView.dataSource=self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil),forCellWithReuseIdentifier: "collCellId")
        
        //table
        tableView.delegate=self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        let vcCart=storyboard?.instantiateViewController(identifier: "cartId") as! CartViewController
        vcCart.mainDelegate=self
    }
    
    @IBAction func radioViewBtn(_ sender: Any) {
        if collectionView.isHidden{
            collectionView.isHidden=false
            tableView.isHidden=true
        }else{
            collectionView.isHidden=true
            tableView.isHidden=false
        }
    }
    
    @IBAction func goToCart(_ sender: Any) {
        showCart()
    }
    
    func appendArrAtStart(){
        products.append(Product(title: "Title 1",
                                desc: "Decription 1",
                                price: 10))
        products.append(Product(title: "Title 2",
                                desc: "Description 2",
                                price: 11))
                               
        products.append(Product(title: "Title 3",
                                desc: "Description 3",
                                price: 12))
      
    }
}

    protocol MainViewControllerDelegate {
    func removeProductFromCart(_ id: Int)
    func showProduct(_ id:Int)
    func addProductToCart(_ item:Product)
    func showCart()
    func getCartProduct() -> [Product]
}

    extension MainViewController: MainViewControllerDelegate{
    func addProductToCart(_ item:Product){
        cartProducts.append(item)
              print("\(item.title ?? "Empty") cart")
        tableView.reloadData()
              print(cartProducts)
    }
    
    func removeProductFromCart(_ id: Int) {
        cartProducts.remove(at: id)
       
    }
    func showCart( ) {
        let vcCart=storyboard?.instantiateViewController(identifier: "cartId") as! CartViewController
        
        vcCart.products = cartProducts
        vcCart.mainDelegate = self
        
        navigationController?.pushViewController(vcCart, animated: true)
    }
    func showProduct(_ id:Int) {
        let vcProd=storyboard?.instantiateViewController(identifier: "prodId") as! ProductViewController
        
        vcProd.product = products[id]
        vcProd.delegate=self
        
        navigationController?.pushViewController(vcProd, animated: true)
    }
    func getCartProduct() -> [Product] {
        let vcCart=storyboard?.instantiateViewController(identifier: "cartId") as! CartViewController
        vcCart.mainDelegate=self
        return cartProducts
    }
    
}
//collection
extension MainViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "collCellId",
                                                    for: indexPath) as! CollectionViewCell
        
        let item = products[indexPath.row]
        print(item)
        
        cell.delegate=self
        cell.id=indexPath.row
        cell.product=item
        cell.titleLabel.text=item.title
        cell.descLabel.text=item.desc
        cell.priceLabel.text="\(item.price ?? 0)"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 150)
    }
}
extension MainViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 200, height: 150)
    }
}
//table
extension MainViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! TableViewCell
        
        let item = products[indexPath.row]
        print(item)
        
        cell.delegate=self
        cell.id=indexPath.row
        cell.product=item
        cell.titleLabel.text=item.title
        cell.descLabel.text=item.desc
        cell.priceLabel.text="\(item.price ?? 0)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcProd=storyboard?.instantiateViewController(identifier: "prodId") as! ProductViewController
        
        vcProd.product = products[indexPath.row]
        vcProd.delegate=self
        
        navigationController?.pushViewController(vcProd, animated: true) 
        
    }
}
