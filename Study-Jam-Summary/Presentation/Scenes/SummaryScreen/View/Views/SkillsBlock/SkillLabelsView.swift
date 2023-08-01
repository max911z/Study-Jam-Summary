import UIKit

final class SkillLabelTapGesture: UITapGestureRecognizer {
    var skill = Skill(id: String(), title: String())
}

class SkillLabelsView: UIView {
    
    // MARK: - Views
    
    private lazy var plusButton: UIButton = {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(AppColors.lightBlack, for: .normal)
        $0.titleLabel?.font = AppFonts.meduim14
        $0.backgroundColor = AppColors.darkWhite
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = Constants.plusButtonCornerRadius

        return $0
    }(UIButton(type: .system))
    
    //- MARK: Properties
    
    var skills: [Skill] = [] {
        didSet {
            updateTagLabels()
        }
    }
    
    var isEditMode: Bool = false {
        didSet {
            updateTagLabels()
            isEditMode ? setupPlusButton() : removePlusButton()
        }
    }
    
    var intrinsicHeight: CGFloat = 0
    
    var skillLabelDeleteButtonTap: ((Skill) -> ())?
    
    var plusButtonTap: (() -> Void)?
    
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
    

    //- MARK: Private methods
    
    private func updateTagLabels() -> Void {
        for subview in subviews {
            subview.removeFromSuperview()
        }
        
        while self.subviews.count > skills.count {
            self.subviews[0].removeFromSuperview()
        }
        
        while self.subviews.count < skills.count {
            let newSkillLabel = SkillLabelView()
            newSkillLabel.isEditMode = isEditMode
            
            self.addSubview(newSkillLabel)
        }
        
        for (skill, v) in zip(skills, self.subviews) {
            guard let label = v as? SkillLabelView else {
                fatalError("non-UILabel subview found!")
            }
            
            label.setTitle(skill.title)
            label.frame.size.width = label.getWidthView()
            label.frame.size.height = Constants.labelHeight
            
            let gestureRecognizer = SkillLabelTapGesture(target: self, action: #selector(onSkillLabelTap(_:)))
            gestureRecognizer.skill.id = skill.id
            gestureRecognizer.skill.title = skill.title
            
            label.deleteButton.addGestureRecognizer(gestureRecognizer)
        }
        
        isEditMode ? setupPlusButton() : nil
    }
    
    private func displayTagLabels() {
        var currentOriginX: CGFloat = 0
        var currentOriginY: CGFloat = 0
        
        self.subviews.forEach { v in
            if let button = v as? UIButton {
                if currentOriginX + button.frame.width > bounds.width {
                    currentOriginX = 0
                    currentOriginY += Constants.labelHeight + Constants.labelsSpacing
                }
                
                button.frame.origin.x = currentOriginX
                button.frame.origin.y = currentOriginY
                
                currentOriginX += button.frame.width + Constants.labelsSpacing
                
            } else {
                guard let label = v as? SkillLabelView else {
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
        }
        
        intrinsicHeight = currentOriginY + Constants.labelHeight
        invalidateIntrinsicContentSize()
    }
    
    private func setupPlusButton() {
        addSubview(plusButton)
        
        plusButton.frame.size.width = Constants.plusButtonSize.width + Constants.plusButtonHorizontalInset * 2
        plusButton.frame.size.height = Constants.plusButtonSize.height + Constants.plusButtonVerticalInset * 2
        
        plusButton.addTarget(self, action: #selector(onPlusButtonTap), for: .touchUpInside)
    }
    
    private func removePlusButton() {
        plusButton.removeFromSuperview()
    }
    
    // MARK: - Actions
    
    @objc
    private func onSkillLabelTap(_ skillLabel: SkillLabelTapGesture) {
        skillLabelDeleteButtonTap?(skillLabel.skill)
    }
    
    @objc
    private func onPlusButtonTap() {
        plusButtonTap?()
    }
}

// MARK: Constants

private extension SkillLabelsView {
    enum Constants {
        static let labelHeight: CGFloat = 44
        static let labelsSpacing: CGFloat = 12
        
        static let plusButtonHorizontalInset: CGFloat = 24
        static let plusButtonVerticalInset: CGFloat = 12
        static let plusButtonSize = CGSize(width: 9, height: 20)
        static let plusButtonCornerRadius: CGFloat = 12
    }
}
