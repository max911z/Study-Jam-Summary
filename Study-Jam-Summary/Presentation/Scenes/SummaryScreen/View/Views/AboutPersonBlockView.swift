import UIKit

final class AboutPersonBlockView: UIView {
    
    // MARK: - Views
    
    private let titleBlockLabel: UILabel = {
        $0.textColor = AppColors.lightBlack
        $0.font = AppFonts.meduim16
        $0.text = "О себе"
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    private let informationPersonLabel: UILabel = {
        $0.textColor = AppColors.lightBlack
        $0.font = AppFonts.regular14
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    // MARK: - Inis
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setInformationPerson(_ information: String) {
        informationPersonLabel.text = information
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubviews(
            titleBlockLabel,
            informationPersonLabel
        )
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleBlockLabel.topAnchor.constraint(equalTo: topAnchor),
            titleBlockLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleBlockLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            informationPersonLabel.topAnchor.constraint(equalTo: titleBlockLabel.bottomAnchor, constant: 8),
            informationPersonLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            informationPersonLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            informationPersonLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Constants

private extension AboutPersonBlockView {
    enum Constants {
        
    }
}
