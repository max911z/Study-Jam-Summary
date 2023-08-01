import UIKit

final class SkillsBlockView: UIView {
    
    // MARK: - Views
    
    private let titleBlockLabel: UILabel = {
        $0.textColor = AppColors.lightBlack
        $0.font = AppFonts.meduim16
        $0.text = "Мои навыки"
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    private let editButton: UIButton = {
        $0.setImage(AppImages.pencilIcon, for: .normal)
        $0.tintColor = AppColors.lightBlack
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton(type: .system))
    
    private let competeButton: UIButton =  {
        $0.setImage(AppImages.completeIcon, for: .normal)
        $0.tintColor = AppColors.black
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton(type: .system))
    
    private let skillLabelsView = SkillLabelsView()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setSkills(_ skills: [Skill]) {
        skillLabelsView.skills = skills
    }
    
    // MARK: - Private Properties
    
    private func setup() {
        setupViews()
        setupConstraints()
        configureActions()
    }
    
    private func setupViews() {
        addSubviews(
            titleBlockLabel,
            editButton,
            skillLabelsView
        )
    }
    
    private func setupConstraints() {
        skillLabelsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleBlockLabel.topAnchor.constraint(equalTo: topAnchor),
            titleBlockLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleBlockLabel.trailingAnchor.constraint(greaterThanOrEqualTo: editButton.leadingAnchor, constant: 8),
            
            editButton.topAnchor.constraint(equalTo: topAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 24),
            editButton.heightAnchor.constraint(equalToConstant: 24),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            skillLabelsView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 16),
            skillLabelsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            skillLabelsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            skillLabelsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureActions() {
        
    }
}

// MARK: - Constants

private extension SkillsBlockView {
    enum Constants {
        
    }
}
