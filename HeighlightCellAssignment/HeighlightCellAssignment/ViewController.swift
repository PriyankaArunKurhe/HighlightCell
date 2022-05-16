import UIKit
class ViewController: UIViewController {
    //MARK: variables
    var previousSelected : IndexPath!
    var currentSelected : Int!
    //MARK: Outlets
    @IBOutlet weak var numberCollectionView: UICollectionView!
    //MARK: Array
    let numbers: [Int] = [1,2,3,4,5,6,7,8,9,10]
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Registration of collectionView cell
        let nibFile = UINib(nibName: "NumbersCollectionViewCel", bundle: nil)
        self.numberCollectionView.register(nibFile, forCellWithReuseIdentifier: "NumbersCollectionViewCel")
        numberCollectionView.dataSource = self
        numberCollectionView.delegate = self
    }
}
//MARK: Datasourse Methods
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numbers.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = numberCollectionView.dequeueReusableCell(withReuseIdentifier: "NumbersCollectionViewCel", for: indexPath) as? NumbersCollectionViewCel else{
            return UICollectionViewCell()
        }
        cell.numberLabel.text = String(numbers[indexPath.row])
        
        if currentSelected != nil && currentSelected == indexPath.row
        {
            cell.backgroundColor = UIColor.green
        }else{
            cell.backgroundColor = UIColor.yellow
        }
        return cell
    }
}
//MARK: Delegate Methods
extension ViewController: UICollectionViewDelegate {
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if previousSelected != nil{
            if let cell = collectionView.cellForItem(at: previousSelected!){
                cell.backgroundColor = UIColor.yellow
            }
        }
        currentSelected = indexPath.row
        previousSelected = indexPath
        print(previousSelected as Any)
        print(currentSelected as Any)
        self.numberCollectionView.reloadItems(at: [indexPath])
    }
}


