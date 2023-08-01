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
    
    private let completeButton: UIButton =  {
        $0.setImage(AppImages.completeIcon, for: .normal)
        $0.tintColor = AppColors.black
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton(type: .system))
    
    private let skillLabelsView = SkillLabelsView()
    
    // MARK: - Properties
    
    var editButtonTap: (() -> Void)?
    
    var completeButtonTap: (() -> Void)?
    
    var skillLabelDeleteButtonTap: ((Skill) -> Void)?
    
    var plusSkillButtonTap: (() -> Void)?
    
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
        setupBindings()
        setupViews()
        setupConstraints()
        configureActions()
    }
    
    private func setupBindings() {
        skillLabelsView.skillLabelDeleteButtonTap = { [ weak self ] skill in
            self?.skillLabelDeleteButtonTap?(skill)
        }
        
        skillLabelsView.plusButtonTap = { [ weak self ] in
            self?.plusSkillButtonTap?()
        }
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
            titleBlockLabel.heightAnchor.constraint(equalToConstant: 24),
            
            skillLabelsView.topAnchor.constraint(equalTo: titleBlockLabel.bottomAnchor, constant: 16),
            skillLabelsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            skillLabelsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            skillLabelsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        setupConstraintForButton(button: editButton)
    }
    
    private func configureActions() {
        editButton.addTarget(self, action: #selector(onEditButtonTap), for: .touchUpInside)
        completeButton.addTarget(self, action: #selector(onCompleteButtonTap), for: .touchUpInside)
    }
    
    private func setupEditButton() {
        addSubview(editButton)
        
        setupConstraintForButton(button: editButton)
        
        completeButton.removeFromSuperview()
    }
    
    private func setupCompeteButton() {
        addSubview(completeButton)
        
        setupConstraintForButton(button: completeButton)
        
        editButton.removeFromSuperview()
    }
    
    private func setupConstraintForButton(button: UIButton) {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.widthAnchor.constraint(equalToConstant: 24),
            button.heightAnchor.constraint(equalToConstant: 24),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func onEditButtonTap() {
        setupCompeteButton()
        skillLabelsView.isEditMode.toggle()
        editButtonTap?()
    }
    
    @objc
    private func onCompleteButtonTap() {
        setupEditButton()
        skillLabelsView.isEditMode.toggle()
        completeButtonTap?()
    }
}

// MARK: - Constants

private extension SkillsBlockView {
    enum Constants {
        
    }
}
