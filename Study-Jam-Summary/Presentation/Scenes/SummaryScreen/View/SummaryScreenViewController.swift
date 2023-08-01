import UIKit

final class SummaryScreenViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModel: SummaryScreenViewModel
    
    private let customView: SummaryScreenView = .init()
    
    // MARK: - Inits
    
    init(viewModel: SummaryScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupBindings()
        viewModel.viewDidLoad()
    }
    
    private func setupBindings()  {
        viewModel.skills.bind { [ weak self ] skills in
            self?.customView.skillsBlockBiew.setSkills(skills)
        }
        
        viewModel.profile.bind { [ weak self ] profile in
            self?.customView.setProfileData(profile)
        }
    }
}
