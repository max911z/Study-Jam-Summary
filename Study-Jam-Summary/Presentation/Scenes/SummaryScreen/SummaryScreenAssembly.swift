enum SummaryScreenAssembly {
    public static func make() -> SummaryScreenViewController {
        let viewModel = SummaryScreenViewModelImp(
            .init()
        )

        let viewController = SummaryScreenViewController(viewModel: viewModel)

        return viewController
    }
}
