import UIKit

class SkillLabelsView: UIView {
    
    //- MARK: Public properties
    
    var skills: [Skill] = [] {
        didSet {
            addTagLabels()
        }
    }
    
    var intrinsicHeight: CGFloat = 0
    
    //- MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //- MARK: Override methods
    
    override var intrinsicContentSize: CGSize {
        var view = super.intrinsicContentSize
        view.height = intrinsicHeight
        return view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        displayTagLabels()
    }
    
    
    //- MARK: Public methods
    
    func addTagLabels() -> Void {
        while self.subviews.count > skills.count {
            self.subviews[0].removeFromSuperview()
        }
        
        while self.subviews.count < skills.count {
            let newLabel = UILabel()
            
            newLabel.textColor = AppColors.lightBlack
            newLabel.textAlignment = .center
            newLabel.backgroundColor = AppColors.darkWhite
            newLabel.layer.masksToBounds = true
            newLabel.layer.cornerRadius = Constants.labelCornerRadius
            
            self.addSubview(newLabel)
        }
        
        for (tag, v) in zip(skills, self.subviews) {
            guard let label = v as? UILabel else {
                fatalError("non-UILabel subview found!")
            }
            
            label.text = tag.title
            label.frame.size.width = label.intrinsicContentSize.width + Constants.labelHorizontalPadding
            label.frame.size.height = Constants.labelHeight
        }
        
    }
    
    func displayTagLabels() {
        var currentOriginX: CGFloat = 0
        var currentOriginY: CGFloat = 0
        
        self.subviews.forEach { v in
            
            guard let label = v as? UILabel else {
                fatalError("non-UILabel subview found!")
            }
            
            if currentOriginX + label.frame.width > bounds.width {
                currentOriginX = 0
                currentOriginY += Constants.labelHeight + Constants.labelsSpacing
            }
            
            label.frame.origin.x = currentOriginX
            label.frame.origin.y = currentOriginY
            
            currentOriginX += label.frame.width + Constants.labelsSpacing
            
        }
        
        intrinsicHeight = currentOriginY + Constants.labelHeight
        invalidateIntrinsicContentSize()
    }
}

// MARK: Constants

private extension SkillLabelsView {
    enum Constants {
        static let labelHeight: CGFloat = 44
        static let labelHorizontalPadding: CGFloat = 24
        static let labelsSpacing: CGFloat = 12
        static let labelCornerRadius: CGFloat = 12
    }
}
