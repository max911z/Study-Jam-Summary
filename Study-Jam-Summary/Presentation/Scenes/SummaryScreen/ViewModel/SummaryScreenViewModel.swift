protocol SummaryScreenViewModel: AnyObject {
    
    // MARK: - Input

    func viewDidLoad()
    
    // MARK: - Output
    
    var error: Observable<String> { get }
}

final class SummaryScreenViewModelImp: SummaryScreenViewModel {
    
    // MARK: - Output

    public var error: Observable<String> = .init("")
    
    // MARK: - Private Properties

    private let dependencies: Dependencies
    
    // MARK: - Init

    public init(_ dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Input

    public func viewDidLoad() {
        
    }
}

// MARK: - Nested Types

extension SummaryScreenViewModelImp {
    struct Dependencies {
        
    }
}
