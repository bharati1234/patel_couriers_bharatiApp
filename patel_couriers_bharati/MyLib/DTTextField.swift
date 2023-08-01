//
//  DTTextField.swift
//  Pods
//
//  Created by Dhaval Thanki on 03/04/17.
//
//

import Foundation
import UIKit

public extension String {
    
    var isEmptyStr:Bool{
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces).isEmpty
    }
}

private var kAssociationKeyMaxLength: Int = 400

extension UITextField {
    
    /***************Using This For Done Buton On Keyboard Start*************/
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
            //return true
        }
       /* set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }*/
        set {
                //addDoneButtonOnKeyboard()
            }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
    /***************Using This For Done Buton On Keyboard End*************/
    
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        
        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        let substring = prospectiveText[..<indexEndOfText]
        text = String(substring)
        
        selectedTextRange = selection
    }
}
 class DTTextField: DesignableTextField, UITextFieldDelegate {
    
    //<--------start bottom border---------->
 /*   @IBInspectable open var lineColor : UIColor = UIColor.black {
        didSet{
            dtLayer.borderColor = lineColor.cgColor
        }
    }
    
    @IBInspectable open var selectedLineColor : UIColor = UIColor.black {
        didSet{
        }
    }
    
    
    @IBInspectable open var lineHeight : CGFloat = CGFloat(1.0) {
        didSet{
            dtLayer.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
        }
    }
    
   /* required init?(coder aDecoder: (NSCoder?)) {
        super.init(coder: aDecoder!)
        self.delegate=self;
        dtLayer.borderColor = lineColor.cgColor
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        dtLayer.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
        dtLayer.borderWidth = lineHeight
        self.layer.addSublayer(dtLayer)
        self.layer.masksToBounds = true
    }*/
    
    
    override public func draw(_ rect: CGRect) {
        dtLayer.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        dtLayer.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
        self.delegate = self
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        dtLayer.borderColor = selectedLineColor.cgColor
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        dtLayer.borderColor = lineColor.cgColor
    }*/
    //<--------end bottom border---------->
    
    
    /*@IBInspectable var localisedKey: String? {
        didSet {
            guard let key = localisedKey else { return }
            //text = NSLocalizedString(key, comment: "")
            placeholder = localisedKey?.localizableString(loc: Pref.getPref(key: Constants.shared.LANGUAGE) as! String)
        }
    }*/
    
    @IBInspectable var placeholderPadding: Int = 22 //10
    @IBInspectable var placeholderAlpha: Double = 1.0 //0.0
    
    public enum FloatingDisplayStatus{
        case always
        case never
        case defaults
    }
    
    public enum DTBorderStyle{
        case none
        case rounded
        case sqare
    }
    
    fileprivate var lblFloatPlaceholder:UILabel             = UILabel()
    fileprivate var lblError:UILabel                        = UILabel()
    
    fileprivate let paddingX:CGFloat                        = 0.0
    
    fileprivate let paddingHeight:CGFloat                   = 5.0
    
    public var dtLayer:CALayer                              = CALayer()
     public var floatPlaceholderColor:UIColor                = .darkGray //UIColor(rgb: ConstColors.TextFieldHeaderColor)
     public var floatPlaceholderActiveColor:UIColor          = .darkGray //UIColor(rgb: ConstColors.TextFieldHeaderColor)
    public var floatingLabelShowAnimationDuration           = 0.3
    public var floatingDisplayStatus:FloatingDisplayStatus  = .defaults
    

    public var dtborderStyle:DTBorderStyle = .sqare{
        didSet{
            switch dtborderStyle {
            case .none:
              /*  self.delegate=self;
                dtLayer.borderColor = lineColor.cgColor
                self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
                
                dtLayer.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
                dtLayer.borderWidth = lineHeight
                self.layer.addSublayer(dtLayer)
                self.layer.masksToBounds = true*/
                
                dtLayer.cornerRadius        = 0.0
                dtLayer.borderWidth         = 0.0
            case .rounded:
                dtLayer.cornerRadius        = 25
                self.layer.cornerRadius     = 25
                dtLayer.borderWidth         = 0.5
                //dtLayer.borderColor       = borderColor.cgColor
                
            case .sqare:
                dtLayer.cornerRadius        = 5
                self.layer.cornerRadius     = 5
                dtLayer.borderWidth         = 0.5
                //dtLayer.borderColor         = borderColor.cgColor
                dtLayer.borderColor = UIColor(rgb: ConstColors.TextFieldBorderColor).cgColor
            }
        }
    }
    
    
    public var errorMessage:String = ""{
        didSet{ lblError.text = errorMessage }
    }
    
    public var animateFloatPlaceholder:Bool = true
    public var hideErrorWhenEditing:Bool   = true
    
    public var errorFont = UIFont.systemFont(ofSize: 12.0){
        didSet{ invalidateIntrinsicContentSize() }
    }
    
    public var floatPlaceholderFont = UIFont.systemFont(ofSize: 12.0){
        didSet{ invalidateIntrinsicContentSize() }
    }
    
    public var paddingYFloatLabel:CGFloat = 3.0{
        didSet{ invalidateIntrinsicContentSize() }
    }
    
    public var paddingYErrorLabel:CGFloat = 3.0{
        didSet{ invalidateIntrinsicContentSize() }
    }
    
    public var borderColor:UIColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0){
        didSet{ dtLayer.borderColor = borderColor.cgColor }
    }
    
    public var canShowBorder:Bool = true{
        didSet{ dtLayer.isHidden = !canShowBorder }
    }
    
    public var placeholderColor:UIColor?{
        didSet{
            guard let color = placeholderColor else { return }
            attributedPlaceholder = NSAttributedString(string: placeholderFinal,
                                                       attributes: [NSAttributedString.Key.foregroundColor:color])
        }
    }
    
    fileprivate var x:CGFloat {
        
        if let leftView = leftView {
            return leftView.frame.origin.x + leftView.bounds.size.width - paddingX
        }
        
        return paddingX
    }
    
    fileprivate var fontHeight:CGFloat{
        return ceil(font!.lineHeight)
    }
    
    fileprivate var dtLayerHeight:CGFloat{
        return showErrorLabel ? floor(bounds.height - lblError.bounds.size.height - paddingYErrorLabel) : bounds.height
        //return showErrorLabel ? bounds.height : bounds.height
    }
    
    fileprivate var floatLabelWidth:CGFloat {
        
        var width = bounds.size.width
        
        if let leftViewWidth = leftView?.bounds.size.width {
            width -= leftViewWidth
        }
        
        if let rightViewWidth = rightView?.bounds.size.width {
            width -= rightViewWidth
        }
        
        return width - (self.x * 2)
    }
    
    fileprivate var placeholderFinal:String{
        if let attributed = attributedPlaceholder { return attributed.string }
        return placeholder ?? " "
    }
    
    fileprivate var isFloatLabelShowing:Bool = false
    
    fileprivate var showErrorLabel:Bool = false{
        didSet{
            
            guard showErrorLabel != oldValue else { return }
            
            guard showErrorLabel else {
                hideErrorMessage()
                return
            }
            
            guard !errorMessage.isEmptyStr else { return }
            showErrorMessage()
        }
    }
    
    override public var borderStyle: UITextField.BorderStyle{
        didSet{
            guard borderStyle != oldValue else { return }
            borderStyle = .none
        }
    }
    
    public override var textAlignment: NSTextAlignment{
        didSet{ setNeedsLayout() }
    }
    
    public override var text: String?{
        didSet{ self.textFieldTextChanged() }
    }
    
    override public var placeholder: String?{
        didSet{
            
            guard let color = placeholderColor else {
                lblFloatPlaceholder.text = placeholderFinal
                return
            }
            attributedPlaceholder = NSAttributedString(string: placeholderFinal,
                                                       attributes: [NSAttributedString.Key.foregroundColor:color])
            
        }
    }


    override public var attributedPlaceholder: NSAttributedString?{
        didSet{ lblFloatPlaceholder.text = placeholderFinal }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public func showError(message:String? = nil) {
        if let msg = message { errorMessage = msg }
        showErrorLabel = true
    }
    
    public func hideError()  {
        showErrorLabel = false
    }
    
    
    fileprivate func commonInit() {
        
        dtborderStyle               = .sqare
        if isEnabled{
            dtLayer.backgroundColor     = UIColor.white.cgColor
        }else{
            dtLayer.borderColor = UIColor(rgb: ConstColors.TextFieldHeaderColor).cgColor
        }
        
        floatPlaceholderColor       = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        
        floatPlaceholderColor       = UIColor(rgb: ConstColors.TextFieldHeaderColor)
        floatPlaceholderActiveColor = UIColor(rgb: ConstColors.TextFieldHeaderColor)
        
        
        lblFloatPlaceholder.frame   = CGRect.zero
        lblFloatPlaceholder.alpha   = CGFloat(placeholderAlpha)
        lblFloatPlaceholder.font    = .systemFont(ofSize: 12)
        lblFloatPlaceholder.text    = placeholderFinal
        
        
        addSubview(lblFloatPlaceholder)
        
        lblError.frame              = CGRect.zero
        lblError.font               = errorFont
        lblError.textColor          = UIColor.red
        lblError.numberOfLines      = 0
        lblError.isHidden           = true
        
        lblFloatPlaceholder.textAlignment = .center
        lblFloatPlaceholder.backgroundColor = .white
        
        
        addTarget(self, action: #selector(textFieldTextChanged), for: .editingChanged)
        
        addSubview(lblError)
        
        layer.insertSublayer(dtLayer, at: 0)
    }
    
    fileprivate func showErrorMessage(){
        dtLayer.borderColor = UIColor(rgb: ConstColors.ErrorColor).cgColor
        lblError.text = errorMessage
        lblError.isHidden = false
        let boundWithPadding = CGSize(width: bounds.width - (paddingX * 2), height: bounds.height)
        lblError.frame = CGRect(x: paddingX, y: 0, width: boundWithPadding.width, height: boundWithPadding.height)
        lblError.sizeToFit()
        
        invalidateIntrinsicContentSize()
        
    }
    
    func setErrorLabelAlignment() {
        var newFrame = lblError.frame
        
        if textAlignment == .right {
            newFrame.origin.x = bounds.width - paddingX - newFrame.size.width
        }else if textAlignment == .left{
            newFrame.origin.x = paddingX
        }else if textAlignment == .center{
            newFrame.origin.x = (bounds.width / 2.0) - (newFrame.size.width / 2.0)
        }else if textAlignment == .natural{
            
            if UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft{
                newFrame.origin.x = bounds.width - paddingX - newFrame.size.width
            }
        }
        
        //Changes
        newFrame.origin.x = paddingX + 10
        //newFrame.origin.y = 10
        
        lblError.frame = newFrame
    }
    
    func setFloatLabelAlignment() {
        var newFrame = lblFloatPlaceholder.frame
        
        if textAlignment == .right {
            newFrame.origin.x = bounds.width - paddingX - newFrame.size.width
        }else if textAlignment == .left{
            newFrame.origin.x = paddingX
        }else if textAlignment == .center{
            newFrame.origin.x = (bounds.width / 2.0) - (newFrame.size.width / 2.0)
        }else if textAlignment == .natural{
            
            if UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft{
                newFrame.origin.x = bounds.width - paddingX - newFrame.size.width
            }
        }
        //Changes
        newFrame.origin.x = paddingX // + 10
        newFrame.size.width = newFrame.size.width + 15
        
        lblFloatPlaceholder.frame = newFrame
    }
    
    fileprivate func hideErrorMessage(){
        
        dtLayer.borderColor = UIColor(rgb: ConstColors.TextFieldBorderColor).cgColor
        
        
        lblError.text = ""
        lblError.isHidden = true
        lblError.frame = CGRect.zero
        invalidateIntrinsicContentSize()
    }
    
    fileprivate func showFloatingLabel(_ animated:Bool) {
        
        let animations:(()->()) = {
            self.lblFloatPlaceholder.alpha = 1.0
            self.lblFloatPlaceholder.frame = CGRect(x: self.lblFloatPlaceholder.frame.origin.x,
                                                    y: self.paddingYFloatLabel - CGFloat(self.placeholderPadding),
                                                    width: self.lblFloatPlaceholder.bounds.size.width,
                                                    height: self.lblFloatPlaceholder.bounds.size.height)
        }
        
        if animated && animateFloatPlaceholder {
            UIView.animate(withDuration: floatingLabelShowAnimationDuration,
                           delay: 0.0,
                           options: [.beginFromCurrentState,.curveEaseOut],
                           animations: animations){ status in
                            DispatchQueue.main.async {
                                self.layoutIfNeeded()
                            }
            }
        }else{
            animations()
        }
    }
    
    fileprivate func hideFlotingLabel(_ animated:Bool) {
        
        var y = 0
        
        if self.placeholderPadding > 19{
            y = Int(self.paddingYFloatLabel - CGFloat(self.placeholderPadding))
        }else{
            y = Int(self.lblFloatPlaceholder.font.lineHeight)
        }
        
        
        let animations:(()->()) = {
            self.lblFloatPlaceholder.alpha = CGFloat(self.placeholderAlpha)
            self.lblFloatPlaceholder.frame = CGRect(x: self.lblFloatPlaceholder.frame.origin.x,
                                                    y: CGFloat(y),
                                                    width: self.lblFloatPlaceholder.bounds.size.width,
                                                    height: self.lblFloatPlaceholder.bounds.size.height)
        }
        
        if animated && animateFloatPlaceholder {
            UIView.animate(withDuration: floatingLabelShowAnimationDuration,
                           delay: 0.0,
                           options: [.beginFromCurrentState,.curveEaseOut],
                           animations: animations){ status in
                            DispatchQueue.main.async {
                                self.layoutIfNeeded()
                            }
            }
        }else{
            animations()
        }
    }
    
    fileprivate func insetRectForEmptyBounds(rect:CGRect) -> CGRect{
        let newX = x
        guard showErrorLabel else { return CGRect(x: newX, y: 0, width: rect.width - newX - paddingX, height: rect.height) }
        
        let topInset = (rect.size.height - lblError.bounds.size.height - paddingYErrorLabel - fontHeight) / 2.0
        let textY = topInset - ((rect.height - fontHeight) / 2.0)
        
        return CGRect(x: newX, y: floor(textY), width: rect.size.width - newX - paddingX, height: rect.size.height)
    }
    
    fileprivate func insetRectForBounds(rect:CGRect) -> CGRect {
        
        guard let placeholderText = lblFloatPlaceholder.text,!placeholderText.isEmptyStr  else {
            return insetRectForEmptyBounds(rect: rect)
        }
        
        if floatingDisplayStatus == .never {
            return insetRectForEmptyBounds(rect: rect)
        }else{
            
            if let text = text,text.isEmptyStr && floatingDisplayStatus == .defaults {
                return insetRectForEmptyBounds(rect: rect)
            }else{
                let topInset = paddingYFloatLabel + lblFloatPlaceholder.bounds.size.height + (paddingHeight / 2.0)
                let textOriginalY = fontHeight
                var textY = topInset - textOriginalY
                
                if textY < 0 && !showErrorLabel { textY = topInset }
                let newX = x
                return CGRect(x: newX, y: ceil(textY), width: rect.size.width - newX - paddingX, height: rect.height)
            }
        }
    }
    
    @objc fileprivate func textFieldTextChanged(){
        guard hideErrorWhenEditing && showErrorLabel else { return }
        showErrorLabel = false
    }
    
    override public var intrinsicContentSize: CGSize{
        self.layoutIfNeeded()
        
        let textFieldIntrinsicContentSize = super.intrinsicContentSize
        
        if showErrorLabel {
            lblFloatPlaceholder.sizeToFit()
            return CGSize(width: textFieldIntrinsicContentSize.width,
                          height: textFieldIntrinsicContentSize.height + paddingYFloatLabel + paddingYErrorLabel + lblFloatPlaceholder.bounds.size.height + lblError.bounds.size.height + paddingHeight)
        }else{
            return CGSize(width: textFieldIntrinsicContentSize.width,
                          height: textFieldIntrinsicContentSize.height + paddingYFloatLabel + lblFloatPlaceholder.bounds.size.height + paddingHeight)
        }
        
    }
    
    let padding = UIEdgeInsets(top: -5, left: 8, bottom: -5, right: 0);

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        //let rect = super.editingRect(forBounds: bounds)
        //return insetRectForBounds(rect: rect)
        }
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
        //let rect = super.textRect(forBounds: bounds)
        //return insetRectForBounds(rect: rect)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
        //let rect = super.editingRect(forBounds: bounds)
        //return insetRectForBounds(rect: rect)
    }
    
    fileprivate func insetForSideView(forBounds bounds: CGRect) -> CGRect{
        var rect = bounds
        rect.origin.x = 15
        //rect.origin.y = 0
        rect.size.height = dtLayerHeight
        return rect
    }
    
   /* override public func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.leftViewRect(forBounds: bounds)
        return insetForSideView(forBounds: rect)
    }
    
    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return insetForSideView(forBounds: rect)
    }*/
    
    override public func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.clearButtonRect(forBounds: bounds)
        rect.origin.y = (dtLayerHeight - rect.size.height) / 2
        return rect
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        dtLayer.frame = CGRect(x: bounds.origin.x,
                               y: bounds.origin.y,
                               width: bounds.width,
                               height: dtLayerHeight)
        CATransaction.commit()
        
        if showErrorLabel {
            dtLayer.frame = CGRect(x: bounds.origin.x,
                                   y: bounds.origin.y+7,
                                   width: bounds.width,
                                   height: dtLayerHeight)
            var lblErrorFrame = lblError.frame
            lblErrorFrame.origin.y = dtLayer.frame.origin.y + dtLayer.frame.size.height + paddingYErrorLabel
            lblError.frame = lblErrorFrame
        }
        
        let floatingLabelSize = lblFloatPlaceholder.sizeThatFits(lblFloatPlaceholder.superview!.bounds.size)
        
        lblFloatPlaceholder.frame = CGRect(x: x, y: lblFloatPlaceholder.frame.origin.y,width: floatingLabelSize.width,height: floatingLabelSize.height)
       
        setErrorLabelAlignment()
        setFloatLabelAlignment()
        lblFloatPlaceholder.textColor = isFirstResponder ? floatPlaceholderActiveColor : floatPlaceholderColor
        
        switch floatingDisplayStatus {
        case .never:
            hideFlotingLabel(isFirstResponder)
        case .always:
            showFloatingLabel(isFirstResponder)
        default:
            if let enteredText = text,!enteredText.isEmptyStr{
               showFloatingLabel(isFirstResponder)
            }else{
                hideFlotingLabel(isFirstResponder)
            }
        }
    }
}

@IBDesignable
class DesignableTextField: UITextField {

    //Delegate when image/icon is tapped.
  /*  private var myDelegate: DesignableTextFieldDelegate? {
        get { return delegate as? DesignableTextFieldDelegate }
    }

    @objc func buttonClicked(btn: UIButton){
        self.myDelegate?.textFieldIconClicked(btn: btn)
    }*/

    //Padding images on left
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }

    //Padding images on Right
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }

    @IBInspectable public var rightPadding: CGFloat = 10
    @IBInspectable var leadingImage: UIImage? { didSet { updateView() }}
    @IBInspectable var color: UIColor = UIColor.lightGray { didSet { updateView() }}
    @IBInspectable var imageColor: UIColor = .gray { didSet { updateView() }}
    @IBInspectable var rtl: Bool = false { didSet { updateView() }}
    
    
    
    func updateView() {
        
        rightViewMode = UITextField.ViewMode.never
        rightView = nil
        leftViewMode = UITextField.ViewMode.never
        leftView = nil

        //leadingImage?.withRenderingMode(.alwaysTemplate)
        if let image = leadingImage {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            

            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(Constants.shared.image(tintedImage, scaledToSize: CGSize(width: 20,height: 20)), for: .normal)
            button.tintColor = imageColor

            button.setTitleColor(UIColor.clear, for: .normal)
          //  button.addTarget(self, action: #selector(buttonClicked(btn:)), for: UIControlEvents.touchDown)
            button.isUserInteractionEnabled = true

            if rtl {
                rightViewMode = UITextField.ViewMode.always
                rightView = button
            } else {
                leftViewMode = UITextField.ViewMode.always
                leftView = button
            }
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}

