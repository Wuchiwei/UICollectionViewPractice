# UICollectionViewPractice

**UICollectionView** 可以做出 `橫向` 跟 `直向` 的滑動，可以透過以下設定完成：

```Swift
class ViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NTU", for: indexPath)
        
        guard let ntuCell = cell as? NTUCollectionViewCell else {
            return cell
        }
        
        ntuCell.label.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        return cell
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout
        
        guard let flowLayout = layout as? UICollectionViewFlowLayout else {
            
            return
        }
        
        collectionView.backgroundColor = UIColor.blue
        
        flowLayout.scrollDirection = .vertical
        
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        
        flowLayout.minimumLineSpacing = 40
        
        flowLayout.minimumInteritemSpacing = 70
        
        flowLayout.sectionInset = UIEdgeInsets(top: 100, left: 40, bottom: 60, right: 0)
    }
}
```

### 程式碼說明

**1.** 

你必須要讓 `ViewController Conform UICollectionViewDataSource protocol`，這就必須要實作以下兩個 method:

```Swift
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 30
    }
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NTU", for: indexPath)
    
    guard let ntuCell = cell as? NTUCollectionViewCell else {
        return cell
    }
    
    ntuCell.label.text = "Section \(indexPath.section) Row \(indexPath.row)"
    
    return cell
}
```

**2.**

接著將 collectionView 的 **dataSource** 變數指向 ViewController:

```Swift
collectionView.dataSource = self
```

**3.**

調整 UICollectionView 的 Layout Object: 

```swift
let layout = collectionView.collectionViewLayout
        
guard let flowLayout = layout as? UICollectionViewFlowLayout else {
    
    return
}

collectionView.backgroundColor = UIColor.blue

flowLayout.scrollDirection = .vertical

flowLayout.itemSize = CGSize(width: 100, height: 100)

flowLayout.minimumLineSpacing = 40

flowLayout.minimumInteritemSpacing = 70

flowLayout.sectionInset = UIEdgeInsets(top: 100, left: 40, bottom: 60, right: 0)
```

**scrollDirection:** UICollectionView 的滑動方向

**itemSize:** UICollectionView `item 的大小`

**minimumLineSpacing:** UICollectionView 每一行之間的`最小距離`

**minimumInteritemSpacing:** UICollectionView 的 `Item 之間的最小距離`

**sectionInset:** UICollectionView 的 `Item 與 Section 邊界的距離`
