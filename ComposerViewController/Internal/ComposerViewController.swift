//
//  ViewController.swift
//  PostComposerView
//
//  Created by Alex Takahashi on 11/1/20.
//

import UIKit

class ComposerViewController: UIViewController {
    
    weak var delegate: ComposerViewControllerDelegate?
    
    let label = UILabel()
    let composerTextView = ComposerTextView()
    let verticalPadding: CGFloat = 8
    let defaultBottomPadding: CGFloat = 16

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.view.addSubview(label)
        label.font = UIFont.baseFont
        label.text = "Journal Log Entry"
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor.white
        self.view.addSubview(composerTextView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(handleRightBarButtonTap))
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.baseFont], for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(handleLeftBarButtonTap))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let labelSize = label.sizeThatFits(CGSize(width: self.view.bounds.width - self.view.layoutMarginsHorizontal,
                                                  height: CGFloat.greatestFiniteMagnitude))
        label.frame = CGRect(x: self.view.layoutMargins.left,
                             y: self.view.layoutMargins.top + verticalPadding,
                             width: self.view.bounds.width - self.view.layoutMarginsHorizontal,
                             height: labelSize.height)
        let composerTextViewMinY = label.frame.maxY + verticalPadding
        composerTextView.frame = CGRect(x: self.view.layoutMargins.left,
                                        y: composerTextViewMinY,
                                        width: self.view.bounds.width - self.view.layoutMarginsHorizontal,
                                        height: self.view.frame.maxY - composerTextViewMinY - (self.view.safeAreaInsets.bottom == 0 ? defaultBottomPadding : self.view.safeAreaInsets.bottom))
    }
    
    @objc func handleRightBarButtonTap() {
        self.dismiss(animated: true) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.composerViewControllerDidPost(viewController: strongSelf, model: ComposerModel(text: strongSelf.composerTextView.text))
        }
    }
    
    @objc func handleLeftBarButtonTap() {
        delegate?.composerViewControllerWillDiscardPost(viewController: self, discardHandlerShouldDiscard: { (shouldDismiss) in
            if (shouldDismiss) {
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}
