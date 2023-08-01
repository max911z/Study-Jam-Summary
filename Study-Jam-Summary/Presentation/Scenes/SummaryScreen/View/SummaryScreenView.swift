import UIKit

final class SummaryScreenView: UIView {
    
    // MARK: - Views
    
    let skillsBlockBiew = SkillsBlockView()
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let profileBlockView = ProfileBlockView()
    
    private let aboutPersonBlockView = AboutPersonBlockView()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setProfileData(_ profile: Profile) {
        profileBlockView.setProfileData(profile)
        aboutPersonBlockView.setInformationPerson(profile.description)
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        configureUI()
        setupViews()
        setupConstraints()
    }
    
    private func configureUI() {
        backgroundColor = AppColors.white
    }
    
    private func setupViews() {
//        addSubview(scrollView)
//
//        scrollView.addSubview(contentView)
//
//        contentView.addSubviews(
//            titleScreenLabel
//        )
        
        addSubviews(
            profileBlockView,
            skillsBlockBiew,
            aboutPersonBlockView
        )
    }
    
    private func setupConstraints() {
        //        NSLayoutConstraint.activate([
        //            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        //            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        //            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
        //            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        //        ])
        //
        //        NSLayoutConstraint.activate([
        //            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
        //            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
        //            contentView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
        //            contentView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor)
        //        ])
        
        profileBlockView.translatesAutoresizingMaskIntoConstraints = false
        skillsBlockBiew.translatesAutoresizingMaskIntoConstraints = false
        aboutPersonBlockView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileBlockView.topAnchor.constraint(equalTo: topAnchor),
            profileBlockView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBlockView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            skillsBlockBiew.topAnchor.constraint(equalTo: profileBlockView.bottomAnchor, constant: 21),
            skillsBlockBiew.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            skillsBlockBiew.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            aboutPersonBlockView.topAnchor.constraint(equalTo: skillsBlockBiew.bottomAnchor, constant: 24),
            aboutPersonBlockView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            aboutPersonBlockView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            aboutPersonBlockView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
}

// MARK: - Constants

private extension SummaryScreenView {
    enum Constants {
        
    }
}
