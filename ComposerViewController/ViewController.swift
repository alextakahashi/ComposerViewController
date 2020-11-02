//
//  ViewController.swift
//  ComposerViewController
//
//  Created by Alex Takahashi on 11/1/20.
//

import UIKit

class ViewController: UIViewController, ComposerViewControllerDelegate {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("Tap Me!", for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = self.view.bounds
    }
    
    @objc func handleButtonTap() {
        let composerViewController = ComposerViewController()
        composerViewController.delegate = self
        let navController = UINavigationController(rootViewController: composerViewController)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    // MARK: ComposerViewControllerDelegate

    func composerViewControllerDidPost(viewController: ComposerViewController, model: ComposerModel) {
        print("✅ Model: \(model.text)")
        let alert = UIAlertController(title: "Posted!", message: "Log Posted: \(model.text ?? "")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func composerViewControllerWillDiscardPost(viewController: ComposerViewController, discardHandlerShouldDiscard: @escaping (Bool) -> ()) {
        let alert = UIAlertController(title: "Discard Post", message: "Are you sure you want to discard your post?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Not Now", comment: "Default action"), style: .default, handler: { _ in
            discardHandlerShouldDiscard(false)
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Discard", comment: "Default action"), style: .destructive, handler: { _ in
            discardHandlerShouldDiscard(true)
        }))
        viewController.present(alert, animated: true, completion: nil)
    }
}
