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
        
        view.backgroundColor = .yellow
    }
}
