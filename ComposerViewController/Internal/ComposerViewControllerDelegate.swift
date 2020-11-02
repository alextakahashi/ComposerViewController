//
//  ComposerViewControllerDelegate.swift
//  PostComposerView
//
//  Created by Alex Takahashi on 11/1/20.
//

import Foundation

protocol ComposerViewControllerDelegate: NSObject {
    func composerViewControllerDidPost(viewController: ComposerViewController, model: ComposerModel)
    func composerViewControllerWillDiscardPost(viewController: ComposerViewController, discardHandlerShouldDiscard:@escaping (Bool) ->())
}
