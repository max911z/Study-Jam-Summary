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
        $0.image = UIImage(named: "avatar")
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
        $0.numberOfLines = 2
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    private let informationPlaceStackView = UIStackView(
        axis: .horizontal,
        spacing: 2
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
            titleScreenLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18),
            titleScreenLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            avatarImage.topAnchor.constraint(equalTo: titleScreenLabel.bottomAnchor, constant: 24+18),
            avatarImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 120),
            avatarImage.heightAnchor.constraint(equalToConstant: 120),

            name.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 16),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 51),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -51),

            detailInformationPersonLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            detailInformationPersonLabel.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            detailInformationPersonLabel.trailingAnchor.constraint(equalTo: name.trailingAnchor),

            informationPlaceStackView.topAnchor.constraint(equalTo: detailInformationPersonLabel.bottomAnchor),
            informationPlaceStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            informationPlaceStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -19),
//             TODO:
//            informationPlaceStackView.leadingAnchor.constraint(equalTo: name.leadingAnchor)
//                .withPriority(.defaultHigh),
//            informationPlaceStackView.trailingAnchor.constraint(equalTo: name.trailingAnchor)
//                .withPriority(.defaultHigh),
            
            placeIconImageView.widthAnchor.constraint(equalToConstant: 16),
            placeIconImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}

// MARK: - Constants

private extension ProfileBlockView {
    enum Constants {
        
    }
}
