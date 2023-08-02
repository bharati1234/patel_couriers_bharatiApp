//
////
////  iOSDropDown.swift
////
////
////  Created by Jishnu Raj T on 26/04/18.
////  Copyright © 2018 JRiOSdev. All rights reserved.
////
//import UIKit
// class DropDown : DesignableTextField {
//
//    var arrow : Arrow!
//    var table : UITableView!
//    var shadow : UIView!
//
//    public  var selectedIndex: Int?
//    public  var indexPath: IndexPath = IndexPath(row: 0, section: 0)
//
//    /*@IBInspectable var localisedKey: String? {
//        didSet {
//            guard let key = localisedKey else { return }
//            //text = NSLocalizedString(key, comment: "")
//            placeholder = localisedKey?.localizableString(loc: Pref.getPref(key: Constants.shared.LANGUAGE) as! String)
//        }
//    }*/
//
//    //MARK: IBInspectable
//   @IBInspectable public var rowHeight: CGFloat = 40
//   @IBInspectable public var isMultiline: CGFloat = 1
//   @IBInspectable public var rowBackgroundColor: UIColor = .white
//   @IBInspectable public var selectedRowColor: UIColor = .lightGray
//   @IBInspectable public var hideOptionsWhenSelect = true
//   @IBInspectable  public var isSearchEnable: Bool = true {
//        didSet{
//            addGesture()
//        }
//    }
//
//
//    @IBInspectable public var borderColor: UIColor =  UIColor.lightGray {
//        didSet {
//            layer.borderColor = borderColor.cgColor
//        }
//    }
//    @IBInspectable public var listHeight: CGFloat = 200{
//        didSet {
//
//        }
//    }
//    @IBInspectable public var borderWidth: CGFloat = 0.0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//
//    @IBInspectable public var cornerRadius: CGFloat = 5.0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//        }
//    }
//
//    @IBInspectable public var tableCornerRadius: CGFloat = 3.0 {
//        didSet {
//
//        }
//    }
//
//    //Variables
//    fileprivate  var tableheightX: CGFloat = 100
//    fileprivate  var dataArray = [String]()
//    fileprivate  var imageArray = [String]()
//    public var optionArray = [String]() {
//        didSet{
//            self.dataArray = self.optionArray
//        }
//    }
//    public var optionImageArray = [String]() {
//        didSet{
//            self.imageArray = self.optionImageArray
//        }
//    }
//    public var optionIds : [Int]?
//    var searchText = String() {
//        didSet{
//            if searchText == "" {
//                self.dataArray = self.optionArray
//            }else{
//                self.dataArray = optionArray.filter {
//                    return $0.range(of: searchText, options: .caseInsensitive) != nil
//                }
//            }
//            reSizeTable()
//            selectedIndex = nil
//            self.table.reloadData()
//        }
//    }
//    @IBInspectable public var arrowSize: CGFloat = 15 {
//        didSet{
//            let center =  arrow.superview!.center
//            arrow.frame = CGRect(x: center.x - arrowSize/2, y: center.y - arrowSize/2, width: arrowSize, height: arrowSize)
//        }
//    }
//
//    // Init
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//        self.delegate = self
//    }
//
//    public required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//        setupUI()
//        self.delegate = self
//    }
//
//
//    //MARK: Closures
//    fileprivate var didSelectCompletion: (String, Int ,Int) -> () = {selectedText, index , id  in }
//    fileprivate var TableWillAppearCompletion: () -> () = { }
//    fileprivate var TableDidAppearCompletion: () -> () = { }
//    fileprivate var TableWillDisappearCompletion: () -> () = { }
//    fileprivate var TableDidDisappearCompletion: () -> () = { }
//    fileprivate var didTextChangeCompletion: () -> () = { }
//
//
//     public override func layoutSubviews() {
//       super.layoutSubviews()
//
//         self.frame.size.height = 40
//
//       // Assuming there is width constraint setup on the textView.
//      // let targetSize = CGSize(width: textView.frame.width, height: CGFloat(MAXFLOAT))
//      // textViewHeightConstraint.constant = textView.sizeThatFits(targetSize).height
//     }
//
//    func setupUI () {
//
//        //print("Data: ", self.frame.size.height)
//
//        let size = self.frame.height
//        let rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
//        self.rightView = rightView
//        self.rightViewMode = .always
//        let arrowContainerView = UIView(frame: rightView.frame)
//        arrowContainerView.tintColor = UIColor.lightGray
//        self.rightView?.addSubview(arrowContainerView)
//        let center = arrowContainerView.center
//        arrow = Arrow(origin: CGPoint(x: center.x - arrowSize/2,y: center.y - arrowSize/2),size: arrowSize)
//        arrowContainerView.addSubview(arrow)
//
//        addGesture()
//    }
//    fileprivate func addGesture (){
//        let gesture =  UITapGestureRecognizer(target: self, action:  #selector(touchAction))
//        if isSearchEnable{
//            self.rightView?.addGestureRecognizer(gesture)
//        }else{
//            self.addGestureRecognizer(gesture)
//        }
//    }
//
//    public func showList() {
//
//        TableWillAppearCompletion()
//        if listHeight > rowHeight * CGFloat( dataArray.count) {
//            self.tableheightX = rowHeight * CGFloat(dataArray.count)
//        }else{
//            self.tableheightX = listHeight
//        }
//        table = UITableView(frame: CGRect(x: self.frame.minX,
//                                          y: self.frame.minY,
//                                          width: self.frame.width,
//                                          height: self.frame.height))
//        shadow = UIView(frame: CGRect(x: self.frame.minX,
//                                      y: self.frame.minY,
//                                      width: self.frame.width,
//                                      height: self.frame.height))
//        shadow.backgroundColor = .clear
//
//        table.dataSource = self
//        table.delegate = self
//        table.alpha = 0
//        table.separatorStyle = .none
//        table.layer.cornerRadius = tableCornerRadius
//        table.backgroundColor = rowBackgroundColor
//        if isMultiline == 1 {
//            table.rowHeight = rowHeight
//        }
//        table.scrollToRow(at: indexPath, at: .top, animated: true)
//
//        self.superview?.superview?.insertSubview(shadow, belowSubview:  self)
//        self.superview?.superview?.insertSubview(table, belowSubview: self)
//        //self.superview?.bringSubviewToFront(self)
//        self.isSelected = true
//        UIView.animate(withDuration: 0.9,
//                       delay: 0,
//                       usingSpringWithDamping: 0.4,
//                       initialSpringVelocity: 0.1,
//                       options: .curveEaseInOut,
//                       animations: { () -> Void in
//
//                        self.table.frame = CGRect(x: self.frame.minX,
//                                                  y: self.frame.maxY+5,
//                                                  width: self.frame.width,
//                                                  height: self.tableheightX)
//
//                        self.table.alpha = 1
//                        self.shadow.frame = self.table.frame
//                        self.shadow.dropShadow1()
//                        self.arrow.position = .up
//
//        },
//                       completion: { (finish) -> Void in
//
//        })
//    }
//
//
//    public func hideList() {
//
//        TableWillDisappearCompletion()
//        UIView.animate(withDuration: 1.0,
//                       delay: 0.4,
//                       usingSpringWithDamping: 0.9,
//                       initialSpringVelocity: 0.1,
//                       options: .curveEaseInOut,
//                       animations: { () -> Void in
//                        self.table.frame = CGRect(x: self.frame.minX,
//                                                  y: self.frame.minY,
//                                                  width: self.frame.width,
//                                                  height: 0)
//                        self.shadow.alpha = 0
//                        self.shadow.frame = self.table.frame
//                        self.arrow.position = .down
//        },
//                       completion: { (didFinish) -> Void in
//
//                        self.shadow.removeFromSuperview()
//                        self.table.removeFromSuperview()
//                        self.isSelected = false
//                        self.TableDidDisappearCompletion()
//        })
//    }
//
//    @objc public func touchAction() {
//
//        isSelected ?  hideList() : showList()
//    }
//    func reSizeTable() {
//        if listHeight > rowHeight * CGFloat( dataArray.count) {
//            self.tableheightX = rowHeight * CGFloat(dataArray.count)
//        }else{
//            self.tableheightX = listHeight
//        }
//        UIView.animate(withDuration: 0.2,
//                       delay: 0.1,
//                       usingSpringWithDamping: 0.9,
//                       initialSpringVelocity: 0.1,
//                       options: .curveEaseInOut,
//                       animations: { () -> Void in
//                        self.table.frame = CGRect(x: self.frame.minX,
//                                                  y: self.frame.maxY+5,
//                                                  width: self.frame.width,
//                                                  height: self.tableheightX)
//
//
//        },
//                       completion: { (didFinish) -> Void in
//                        self.shadow.layer.shadowPath = UIBezierPath(rect: self.table.bounds).cgPath
//
//        })
//    }
//
//    //MARK: Actions Methods
//    public func didSelect(completion: @escaping (_ selectedText: String, _ index: Int , _ id:Int ) -> ()) {
//        didSelectCompletion = completion
//    }
//
//    public func listWillAppear(completion: @escaping () -> ()) {
//        TableWillAppearCompletion = completion
//    }
//
//    public func listDidAppear(completion: @escaping () -> ()) {
//        TableDidAppearCompletion = completion
//    }
//
//    public func listWillDisappear(completion: @escaping () -> ()) {
//        TableWillDisappearCompletion = completion
//    }
//
//    public func listDidDisappear(completion: @escaping () -> ()) {
//        TableDidDisappearCompletion = completion
//    }
//     public func didEditText(completion: @escaping () -> ()) {
//        didTextChangeCompletion = completion
//    }
//}
//
////MARK: UITextFieldDelegate
//extension DropDown : UITextFieldDelegate {
//    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        superview?.endEditing(true)
//        return false
//    }
//
//    public func  textFieldDidBeginEditing(_ textField: UITextField) {
//        //textField.text = ""
//        //self.selectedIndex = nil
//
//        self.dataArray = self.optionArray
//        touchAction()
//        if table != nil{
//        table.scrollToRow(at: indexPath, at: .top, animated: true)
//        }
//    }
//
//    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        return isSearchEnable
//    }
//
//    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if string != "" {
//            self.searchText = self.text! + string
//        }else{
//            let subText = self.text?.dropLast()
//            self.searchText = String(subText!)
//        }
//        if !isSelected {
//            showList()
//        }
//        didTextChangeCompletion()
//        if dataArray.count == 0{
//           self.arrow.position = .down
//           self.shadow.removeFromSuperview()
//           self.table.removeFromSuperview()
//        }
//        return true;
//    }
//}
/////MARK: UITableViewDataSource
//extension DropDown: UITableViewDataSource {
//
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataArray.count
//    }
//
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cellIdentifier = "DropDownCell"
//
//        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
//
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
//        }
//
//        if indexPath.row != selectedIndex{
//            cell!.backgroundColor = rowBackgroundColor
//        }else {
//            cell?.backgroundColor = selectedRowColor
//        }
//
//        if self.imageArray.count > indexPath.row {
//            cell!.imageView!.image = UIImage(named: imageArray[indexPath.row])
//        }
//        cell!.textLabel!.text = "\(dataArray[indexPath.row])"
//        cell!.textLabel!.text = "\(dataArray[indexPath.row])"
//        cell!.accessoryType = indexPath.row == selectedIndex ? .checkmark : .none
//        cell!.selectionStyle = .none
//        cell?.textLabel?.font = self.font
//        cell?.textLabel?.textAlignment = self.textAlignment
//        cell?.textLabel?.numberOfLines = 0
//
//        return cell!
//    }
//}
////MARK: UITableViewDelegate
//extension DropDown: UITableViewDelegate {
//    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedIndex = (indexPath as NSIndexPath).row
//        self.indexPath = indexPath
//       // print("indexPath: ",indexPath.row)
//        let selectedText = self.dataArray[self.selectedIndex!]
//        tableView.cellForRow(at: indexPath)?.alpha = 0
//        UIView.animate(withDuration: 0.5,
//                       animations: { () -> Void in
//                        tableView.cellForRow(at: indexPath)?.alpha = 1.0
//                        tableView.cellForRow(at: indexPath)?.backgroundColor = self.selectedRowColor
//        } ,
//                       completion: { (didFinish) -> Void in
//                        self.text = "\(selectedText)"
//
//                        tableView.reloadData()
//        })
//        if hideOptionsWhenSelect {
//            touchAction()
//            self.endEditing(true)
//        }
//        if let selected = optionArray.index(where: {$0 == selectedText}) {
//            if let id = optionIds?[selected] {
//                didSelectCompletion(selectedText, selected , id )
//            }else{
//                didSelectCompletion(selectedText, selected , 0)
//            }
//        }
//    }
//}
//
//
////MARK: Arrow
//enum Position {
//    case left
//    case down
//    case right
//    case up
//}
//
//class Arrow: UIView {
//
//    var position: Position = .down {
//        didSet{
//            switch position {
//            case .left:
//                self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
//                break
//
//            case .down:
//                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
//                break
//
//            case .right:
//                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
//                break
//
//            case .up:
//                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//                break
//            }
//        }
//    }
//
//    init(origin: CGPoint, size: CGFloat) {
//        super.init(frame: CGRect(x: origin.x, y: origin.y, width: size, height: size))
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func draw(_ rect: CGRect) {
//
//        // Get size
//        let size = self.layer.frame.width
//
//        // Create path
//        let bezierPath = UIBezierPath()
//
//        // Draw points
//        let qSize = size/4
//
//        bezierPath.move(to: CGPoint(x: 0, y: qSize))
//        bezierPath.addLine(to: CGPoint(x: size, y: qSize))
//        bezierPath.addLine(to: CGPoint(x: size/2, y: qSize*3))
//        bezierPath.addLine(to: CGPoint(x: 0, y: qSize))
//        bezierPath.close()
//
//        // Mask to path
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = bezierPath.cgPath
//        if #available(iOS 12.0, *) {
//        self.layer.addSublayer (shapeLayer)
//        } else {
//         self.layer.mask = shapeLayer
//        }
//    }
//}
//
//extension UIView {
//    func dropShadow1(scale: Bool = true) {
//        layer.masksToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.5
//        layer.shadowOffset = CGSize(width: 1, height: 1)
//        layer.shadowRadius = 10
//        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
//    }
//}


//
//  iOSDropDown.swift
//
//
//  Created by Jishnu Raj T on 26/04/18.
//  Copyright © 2018 JRiOSdev. All rights reserved.
//
import UIKit
 class DropDown : DesignableTextField {
    
    var arrow : Arrow!
    var table : UITableView!
    var shadow : UIView!
    var mainParentView: UIView?
    public  var selectedIndex: Int?
    public  var indexPath: IndexPath = IndexPath(row: 0, section: 0)
    
    /*@IBInspectable var localisedKey: String? {
        didSet {
            guard let key = localisedKey else { return }
            //text = NSLocalizedString(key, comment: "")
            placeholder = localisedKey?.localizableString(loc: Pref.getPref(key: Constants.shared.LANGUAGE) as! String)
        }
    }*/
    
    //MARK: IBInspectable
   @IBInspectable public var rowHeight: CGFloat = 40
   @IBInspectable public var isMultiline: CGFloat = 1
   @IBInspectable public var rowBackgroundColor: UIColor = .white
   @IBInspectable public var selectedRowColor: UIColor = .lightGray
   @IBInspectable public var hideOptionsWhenSelect = true
   @IBInspectable  public var isSearchEnable: Bool = true {
        didSet{
            addGesture()
        }
    }
     
     // Add this property to store the desired dropdown color
     @IBInspectable  public  var dropdownColor: UIColor = .white {
             didSet {
                 //  update the arrow color here if needed
               
                 self.backgroundColor = dropdownColor
             }
         }
     // Override isUserInteractionEnabled property
         override public var isUserInteractionEnabled: Bool {
             didSet {
                 arrow.alpha = isUserInteractionEnabled ? 1.0 : 0.3
             }
         }
     // Add the arrowTintColor property observer
     @IBInspectable public var arrowTintColor = UIColor(red: 8/255.0, green: 4/255.0, blue: 132/255.0, alpha: 1.0) {
             didSet {
                 // Update the arrow's tint color
                 arrow.tintColor = arrowTintColor
             }
         }
     
    @IBInspectable public var borderColor: UIColor =  UIColor.lightGray {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable public var listHeight: CGFloat = 200{
        didSet {
            
        }
    }
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 5.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var tableCornerRadius: CGFloat = 3.0 {
        didSet {
            
        }
    }
    
    //Variables
    fileprivate  var tableheightX: CGFloat = 100
    fileprivate  var dataArray = [String]()
    fileprivate  var imageArray = [String]()
    public var optionArray = [String]() {
        didSet{
            self.dataArray = self.optionArray
        }
    }
    public var optionImageArray = [String]() {
        didSet{
            self.imageArray = self.optionImageArray
        }
    }
    public var optionIds : [Int]?
    var searchText = String() {
        didSet{
            if searchText == "" {
                self.dataArray = self.optionArray
            }else{
                self.dataArray = optionArray.filter {
                    return $0.range(of: searchText, options: .caseInsensitive) != nil
                }
            }
            reSizeTable()
            selectedIndex = nil
            self.table.reloadData()
        }
    }
    @IBInspectable public var arrowSize: CGFloat = 15 {
        didSet{
            let center =  arrow.superview!.center
            arrow.frame = CGRect(x: center.x - arrowSize/2, y: center.y - arrowSize/2, width: arrowSize, height: arrowSize)
        }
    }
  
    // Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        self.delegate = self
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupUI()
        self.delegate = self
    }
    
    
    //MARK: Closures
    fileprivate var didSelectCompletion: (String, Int ,Int) -> () = {selectedText, index , id  in }
    fileprivate var TableWillAppearCompletion: () -> () = { }
    fileprivate var TableDidAppearCompletion: () -> () = { }
    fileprivate var TableWillDisappearCompletion: () -> () = { }
    fileprivate var TableDidDisappearCompletion: () -> () = { }
    fileprivate var didTextChangeCompletion: () -> () = { }
     
     
     public override func layoutSubviews() {
       super.layoutSubviews()
         
         self.frame.size.height = 40

       // Assuming there is width constraint setup on the textView.
      // let targetSize = CGSize(width: textView.frame.width, height: CGFloat(MAXFLOAT))
      // textViewHeightConstraint.constant = textView.sizeThatFits(targetSize).height
     }
    
    func setupUI () {
        
        //print("Data: ", self.frame.size.height)
        
        let size = self.frame.height
        let rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.rightView = rightView
        self.rightViewMode = .always
        let arrowContainerView = UIView(frame: rightView.frame)
        arrowContainerView.tintColor = UIColor.lightGray
        self.rightView?.addSubview(arrowContainerView)
        let center = arrowContainerView.center
        arrow = Arrow(origin: CGPoint(x: center.x - arrowSize/2,y: center.y - arrowSize/2),size: arrowSize)
        arrowContainerView.addSubview(arrow)
        
        addGesture()
        
    }
    fileprivate func addGesture (){
        let gesture =  UITapGestureRecognizer(target: self, action:  #selector(touchAction))
        if isSearchEnable{
            self.rightView?.addGestureRecognizer(gesture)
        }else{
            self.addGestureRecognizer(gesture)
        }
    }
    
    public func showList() {
        
      guard let parentView = mainParentView ?? self.superview else {
           return // Exit the method if the mainParentView is not set and self.superview is nil
       }
        TableWillAppearCompletion()
        if listHeight > rowHeight * CGFloat( dataArray.count) {
            self.tableheightX = rowHeight * CGFloat(dataArray.count)
        }else{
            self.tableheightX = listHeight
        }
        table = UITableView(frame: CGRect(x: self.frame.minX,
                                          y: self.frame.minY,
                                          width: self.frame.width,
                                          height: self.frame.height))
        shadow = UIView(frame: CGRect(x: self.frame.minX,
                                      y: self.frame.minY,
                                      width: self.frame.width,
                                      height: self.frame.height))
        shadow.backgroundColor = .clear
        
        table.dataSource = self
        table.delegate = self
        table.alpha = 0
        table.separatorStyle = .none
        table.layer.cornerRadius = tableCornerRadius
        table.backgroundColor = rowBackgroundColor
        if isMultiline == 1 {
            table.rowHeight = rowHeight
        }
        table.scrollToRow(at: indexPath, at: .top, animated: true)
              
      parentView.insertSubview(shadow, belowSubview: self)
      parentView.insertSubview(table, belowSubview: self)
      
      let convertedFrame = self.convert(self.bounds, to: parentView)
      table.frame = CGRect(x: convertedFrame.origin.x,
                           y: convertedFrame.origin.y + convertedFrame.height,
                           width: self.frame.width,
                           height: 0)
      shadow.frame = CGRect(x: convertedFrame.origin.x,
                           y: convertedFrame.origin.y + convertedFrame.height,
                           width: self.frame.width,
                           height: 0)
      
        //self.superview?.bringSubviewToFront(self)
        self.isSelected = true
        UIView.animate(withDuration: 0.9,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .curveEaseInOut,
                       animations: { () -> Void in
                        
          self.table.frame = CGRect(x: convertedFrame.origin.x,
                                                 y: convertedFrame.origin.y + convertedFrame.height + 5,
                                                 width: self.frame.width,
                                                 height: self.tableheightX)
                        
                        self.table.alpha = 1
                        self.shadow.frame = self.table.frame
                        self.shadow.dropShadow1()
                        self.arrow.position = .up
                        
        },
                       completion: { (finish) -> Void in
                        
        })
    }
    
    
    public func hideList() {
      guard let parentView = mainParentView ?? self.superview else {
           return // Exit the method if the mainParentView is not set and self.superview is nil
       }
      let convertedFrame = self.convert(self.bounds, to: parentView)

        TableWillDisappearCompletion()
        UIView.animate(withDuration: 1.0,
                       delay: 0.4,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.1,
                       options: .curveEaseInOut,
                       animations: { () -> Void in
              self.table.frame = CGRect(x: convertedFrame.origin.x,
                                                 y: convertedFrame.origin.y,
                                                 width: self.frame.width,
                                                 height: 0)
                        self.shadow.alpha = 0
                        self.shadow.frame = self.table.frame
                        self.arrow.position = .down
        },
                       completion: { (didFinish) -> Void in
                        
                        self.shadow.removeFromSuperview()
                        self.table.removeFromSuperview()
                        self.isSelected = false
                        self.TableDidDisappearCompletion()
        })
    }
    
    @objc public func touchAction() {
        
        isSelected ?  hideList() : showList()
    }
    func reSizeTable() {
      guard let parentView = mainParentView ?? self.superview else {
              return // Exit the method if the mainParentView is not set and self.superview is nil
          }

          if listHeight > rowHeight * CGFloat(dataArray.count) {
              self.tableheightX = rowHeight * CGFloat(dataArray.count)
          } else {
              self.tableheightX = listHeight
          }

          // Use 'parentView' instead of 'self.superview'
          let convertedFrame = self.convert(self.bounds, to: parentView)
          UIView.animate(withDuration: 0.2,
                         delay: 0.1,
                         usingSpringWithDamping: 0.9,
                         initialSpringVelocity: 0.1,
                         options: .curveEaseInOut,
                         animations: { () -> Void in
                             self.table.frame = CGRect(x: convertedFrame.origin.x,
                                                       y: convertedFrame.origin.y + convertedFrame.height + 5,
                                                       width: self.frame.width,
                                                       height: self.tableheightX)

          },
                         completion: { (didFinish) -> Void in
                             self.shadow.layer.shadowPath = UIBezierPath(rect: self.table.bounds).cgPath

          })

    }
    
    //MARK: Actions Methods
    public func didSelect(completion: @escaping (_ selectedText: String, _ index: Int , _ id:Int ) -> ()) {
        didSelectCompletion = completion
    }
    
    public func listWillAppear(completion: @escaping () -> ()) {
        TableWillAppearCompletion = completion
    }
    
    public func listDidAppear(completion: @escaping () -> ()) {
        TableDidAppearCompletion = completion
    }
    
    public func listWillDisappear(completion: @escaping () -> ()) {
        TableWillDisappearCompletion = completion
    }
    
    public func listDidDisappear(completion: @escaping () -> ()) {
        TableDidDisappearCompletion = completion
    }
     public func didEditText(completion: @escaping () -> ()) {
        didTextChangeCompletion = completion
    }
}

//MARK: UITextFieldDelegate
extension DropDown : UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        superview?.endEditing(true)
        return false
    }
    
    public func  textFieldDidBeginEditing(_ textField: UITextField) {
        //textField.text = ""
        //self.selectedIndex = nil
        
        self.dataArray = self.optionArray
        touchAction()
        if table != nil{
        table.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return isSearchEnable
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string != "" {
            self.searchText = self.text! + string
        }else{
            let subText = self.text?.dropLast()
            self.searchText = String(subText!)
        }
        if !isSelected {
            showList()
        }
        didTextChangeCompletion()
        if dataArray.count == 0{
           self.arrow.position = .down
           self.shadow.removeFromSuperview()
           self.table.removeFromSuperview()
        }
        return true;
    }
}
///MARK: UITableViewDataSource
extension DropDown: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DropDownCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        if indexPath.row != selectedIndex{
            cell!.backgroundColor = rowBackgroundColor
        }else {
            cell?.backgroundColor = selectedRowColor
        }
        
        if self.imageArray.count > indexPath.row {
            cell!.imageView!.image = UIImage(named: imageArray[indexPath.row])
        }
        cell!.textLabel!.text = "\(dataArray[indexPath.row])"
        cell!.textLabel!.text = "\(dataArray[indexPath.row])"
        cell!.accessoryType = indexPath.row == selectedIndex ? .checkmark : .none
        cell!.selectionStyle = .none
        cell?.textLabel?.font = self.font
        cell?.textLabel?.textAlignment = self.textAlignment
        cell?.textLabel?.numberOfLines = 0
        
        return cell!
    }
}
//MARK: UITableViewDelegate
extension DropDown: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = (indexPath as NSIndexPath).row
        self.indexPath = indexPath
       // print("indexPath: ",indexPath.row)
        let selectedText = self.dataArray[self.selectedIndex!]
        tableView.cellForRow(at: indexPath)?.alpha = 0
        UIView.animate(withDuration: 0.5,
                       animations: { () -> Void in
                        tableView.cellForRow(at: indexPath)?.alpha = 1.0
                        tableView.cellForRow(at: indexPath)?.backgroundColor = self.selectedRowColor
        } ,
                       completion: { (didFinish) -> Void in
                        self.text = "\(selectedText)"
                        
                        tableView.reloadData()
        })
        if hideOptionsWhenSelect {
            touchAction()
            self.endEditing(true)
        }
        if let selected = optionArray.index(where: {$0 == selectedText}) {
            if let id = optionIds?[selected] {
                didSelectCompletion(selectedText, selected , id )
            }else{
                didSelectCompletion(selectedText, selected , 0)
            }
        }
    }
}


//MARK: Arrow
enum Position {
    case left
    case down
    case right
    case up
}


// arrow class updated code to change the arrow tint color
class Arrow: UIView {

    var position: Position = .down {
        didSet {
            switch position {
            case .left:
                self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
            case .down:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
            case .right:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
            case .up:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }
        }
    }

    var arrowTintColor: UIColor = UIColor(red: 8/255.0, green: 4/255.0, blue: 132/255.0, alpha: 1.0)  {
        didSet {
            arrowShapeLayer.fillColor = arrowTintColor.cgColor
        }
    }

    private let arrowShapeLayer = CAShapeLayer()

    init(origin: CGPoint, size: CGFloat) {
        super.init(frame: CGRect(x: origin.x, y: origin.y, width: size, height: size))
        setupArrow()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupArrow() {
        let size = self.layer.frame.width
        let bezierPath = UIBezierPath()
        let qSize = size/4

        bezierPath.move(to: CGPoint(x: 0, y: qSize))
        bezierPath.addLine(to: CGPoint(x: size, y: qSize))
        bezierPath.addLine(to: CGPoint(x: size/2, y: qSize*3))
        bezierPath.addLine(to: CGPoint(x: 0, y: qSize))
        bezierPath.close()

        arrowShapeLayer.path = bezierPath.cgPath
        arrowShapeLayer.fillColor = arrowTintColor.cgColor
        self.layer.addSublayer(arrowShapeLayer)
    }
}

extension UIView {
    func dropShadow1(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

