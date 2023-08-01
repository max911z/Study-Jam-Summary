import UIKit

final class SkillLabelView: UIView {
    
    // MARK: - Views
    
    lazy var deleteButton: UIButton = {
        $0.setImage(AppImages.deleteIcon, for: .normal)
        $0.tintColor = AppColors.black
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton(type: .system))
    
    private let titleLabel: UILabel = {
        $0.textColor = AppColors.lightBlack
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    // MARK: - Properties
    
    var isEditMode: Bool = false {
        didSet {
            isEditMode
                ? setupDeleteButton()
                : removeDeleteButton()
        }
    }
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func getWidthView() -> CGFloat {
        var width = titleLabel.intrinsicContentSize.width + Constants.labelHorizontalInset
        let screenWidth = UIScreen.main.bounds.width

        width += isEditMode
            ? Constants.deleteButtonLeadingInset
                + Constants.deleteButtonSize.width
                + Constants.deleteButtonTrailingInset
            : Constants.labelHorizontalInset
        
        if screenWidth <= width {
            return screenWidth - 16 * 2
        }

        return width
    }
    
    // MARK: - Private Properties
    
    private func setup() {
        configureUI()
        setupViews()
        setupConstraints()
    }
    
    private func configureUI() {
        backgroundColor = AppColors.darkWhite
        layer.masksToBounds = true
        layer.cornerRadius = Constants.labelCornerRadius
    }
    
    private func setupViews() {
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: Constants.labelHorizontalInset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -Constants.labelHorizontalInset)
        ])
    }
    
    private func setupDeleteButton() {
        addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: topAnchor),
            deleteButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: -Constants.deleteButtonTrailingInset),
            deleteButton.widthAnchor.constraint(equalToConstant: Constants.deleteButtonSize.width)
        ])
        
        constraints.forEach {
            if $0.firstItem === titleLabel && $0.firstAttribute == .leading {
                $0.constant = Constants.labelHorizontalInset
            }
            
            if $0.firstItem === titleLabel && $0.firstAttribute == .trailing {
                let insetsForTitleLabelTrailingSpacing = Constants.deleteButtonLeadingInset + Constants.deleteButtonTrailingInset
                $0.constant = -Constants.deleteButtonSize.width - insetsForTitleLabelTrailingSpacing
            }
        }
    }
    
    private func removeDeleteButton() {
        constraints.forEach {
            if $0.firstItem === titleLabel && $0.firstAttribute == .trailing {
                $0.constant = -Constants.labelHorizontalInset
            }
        }
        
        deleteButton.removeFromSuperview()
    }
}

// MARK: Constants

private extension SkillLabelView {
    enum Constants {
        static let labelCornerRadius: CGFloat = 12
        static let labelHorizontalInset: CGFloat = 24
        
        static let deleteButtonLeadingInset: CGFloat = 10
        static let deleteButtonTrailingInset: CGFloat = 24
        static let deleteButtonSize = CGSize(width: 14, height: 14)
    }
}
