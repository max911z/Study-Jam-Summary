import UIKit

final class ProfileBlockView: UIView {
    
    // MARK: - Views
    
    private let titleScreenLabel: UILabel = {
        $0.textColor = AppColors.lightBlack
        $0.textAlignment = .center
        $0.font = AppFonts.bold16
        $0.text = "Профиль"
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    private lazy var avatarImage: CircleImageView = {
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(CircleImageView())
    
    private let name: UILabel = {
        $0.textColor = AppColors.lightBlack
        $0.textAlignment = .center
        $0.font = AppFonts.bold24
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    private let detailInformationPersonLabel: UILabel = {
        $0.textColor = AppColors.gray
        $0.textAlignment = .center
        $0.font = AppFonts.regular14
        $0.numberOfLines = Constants.detailInformationPersonLabelCountLines
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    private let informationPlaceStackView = UIStackView(
        axis: .horizontal,
        spacing: Constants.informationPlaceStackViewSpacing
    )
    
    private let placeIconImageView: UIImageView = {
        $0.image = AppImages.placeIcon
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIImageView())
    
    private let placeLabel: UILabel = {
        $0.textColor = AppColors.gray
        $0.font = AppFonts.regular14
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
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
        name.text = profile.name
        detailInformationPersonLabel.text = profile.shortDescription
        placeLabel.text = profile.place
    }
    
    func setAvatar(_ avatar: String) {
        avatarImage.image = UIImage(named: avatar)
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        configureUI()
        setupViews()
        setupConstraints()
    }
    
    private func configureUI() {
        backgroundColor = AppColors.darkWhite
    }
    
    private func setupViews() {
        addSubviews(
            titleScreenLabel,
            avatarImage,
            name,
            detailInformationPersonLabel,
            informationPlaceStackView
        )
        
        informationPlaceStackView.addArrangedSubviews(
            placeIconImageView,
            placeLabel
        )
    }
    
    private func setupConstraints() {
        informationPlaceStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleScreenLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                  constant: Constants.titleScreenLabelTopInset),
            titleScreenLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            avatarImage.topAnchor.constraint(equalTo: titleScreenLabel.bottomAnchor,
                                             constant: Constants.avatarImageTopInset),
            avatarImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: Constants.avatarImageSize.width),
            avatarImage.heightAnchor.constraint(equalToConstant: Constants.avatarImageSize.height),

            name.topAnchor.constraint(equalTo: avatarImage.bottomAnchor,
                                      constant: Constants.nameTopInset),
            name.leadingAnchor.constraint(equalTo: leadingAnchor,
                                          constant: Constants.nameHorizontalInset),
            name.trailingAnchor.constraint(equalTo: trailingAnchor,
                                           constant: -Constants.nameHorizontalInset),

            detailInformationPersonLabel.topAnchor.constraint(equalTo: name.bottomAnchor,
                                                              constant: Constants.detailInformationPersonLabelTopInset),
            detailInformationPersonLabel.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            detailInformationPersonLabel.trailingAnchor.constraint(equalTo: name.trailingAnchor),

            informationPlaceStackView.topAnchor.constraint(equalTo: detailInformationPersonLabel.bottomAnchor),
            informationPlaceStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            informationPlaceStackView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                              constant: -Constants.informationPlaceStackViewBottomInset),
            
            placeIconImageView.widthAnchor.constraint(equalToConstant: Constants.placeIconImageViewSize.width),
            placeIconImageView.heightAnchor.constraint(equalToConstant: Constants.placeIconImageViewSize.height)
        ])
    }
}

// MARK: - Constants

private extension ProfileBlockView {
    enum Constants {
        static let titleScreenLabelTopInset: CGFloat = 18
        
        static let avatarImageTopInset: CGFloat = 24+18
        static let avatarImageSize = CGSize(width: 120, height: 120)
        
        static let nameTopInset: CGFloat = 16
        static let nameHorizontalInset: CGFloat = 51
        
        static let detailInformationPersonLabelTopInset: CGFloat = 4
        
        static let informationPlaceStackViewBottomInset: CGFloat = 19
        
        static let placeIconImageViewSize = CGSize(width: 16, height: 16)
        
        static let informationPlaceStackViewSpacing: CGFloat = 2
        
        static let detailInformationPersonLabelCountLines = 2
    }
}
