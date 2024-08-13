import UIKit

public protocol WMFAltTextPreviewDelegate: AnyObject {
    func didTapPublish(viewModel: WMFAltTextExperimentPreviewViewModel)
}

final fileprivate class WMFAltTextExperimentPreviewHostingViewController: WMFComponentHostingController<WMFAltTextExperimentPreviewView> {

    init(viewModel: WMFAltTextExperimentPreviewViewModel) {
        let rootView = WMFAltTextExperimentPreviewView(viewModel: viewModel)
        super.init(rootView: rootView)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final public class WMFAltTextExperimentPreviewViewController: WMFCanvasViewController {

    private let hostingViewController: WMFAltTextExperimentPreviewHostingViewController
    // add logging delegate
    private var viewModel: WMFAltTextExperimentPreviewViewModel
    public weak var delegate: WMFAltTextPreviewDelegate?

    public init(viewModel: WMFAltTextExperimentPreviewViewModel, delegate: WMFAltTextPreviewDelegate?) {
        self.hostingViewController = WMFAltTextExperimentPreviewHostingViewController(viewModel: viewModel)
        self.delegate = delegate
        self.viewModel = viewModel

        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.localizedStrings.title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: String(), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: viewModel.localizedStrings.publishTitle, style: .plain, target: self, action: #selector(publishWikitext))
        addComponent(hostingViewController, pinToEdges: true)

    }

    @objc private func publishWikitext() {
        self.dismiss(animated: true) {
            self.delegate?.didTapPublish(viewModel: self.viewModel)
        }

    }
}
