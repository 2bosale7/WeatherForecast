//
//  ParentViewController.swift
//  WeatherForecast
//
//  Created by Mohammed Saleh on 11/16/21.
//

import UIKit

import Reachability
import SwiftEmptyState

class ParentViewController: UIViewController {
    
    var activityIndicatorView:UIActivityIndicatorView!
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private let titleAttributes = [NSAttributedString.Key.font: AppFont().normalSize, NSAttributedString.Key.foregroundColor: UIColor.black]
    private let messageAttributes = [NSAttributedString.Key.font: AppFont().normalSize, NSAttributedString.Key.foregroundColor: UIColor.black]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createLoader()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func showAlert(title: String?, message: String?, shouldpop: Bool) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.blue
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
            
            if shouldpop
            {
                if let navController = self.navigationController
                {
                    navController.popViewController(animated: true)
                }
                else
                {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        let titAttrString = NSMutableAttributedString(string: title ?? "", attributes: titleAttributes)
        let msgAttrString = NSMutableAttributedString(string: message ?? "", attributes: messageAttributes)
        alertController.setValue(titAttrString, forKey: "attributedTitle")
        alertController.setValue(msgAttrString, forKey: "attributedMessage")
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true)
    }
    
    private func createLoader(){
        let height = CGFloat(40)
        let width = CGFloat(40)
        let x = (self.view.frame.width / 2) - width / 2
        let y = (self.view.frame.height / 2)
        let frame = CGRect(x: x, y: y, width: width, height: height)
        activityIndicatorView = UIActivityIndicatorView(frame: frame)
        activityIndicatorView.style = .medium
        activityIndicatorView.color = CMColor.theme.value
        activityIndicatorView.backgroundColor = UIColor.white
        activityIndicatorView.layer.cornerRadius = 5
        activityIndicatorView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        activityIndicatorView.layer.borderWidth = 0.4
        self.view.addSubview(activityIndicatorView)
    }
    
    func showLoader() {
        activityIndicatorView.startAnimating()
    }
    
    func hideLoader() {
        activityIndicatorView.stopAnimating()
    }
    
    func showConfirmationAlert(title: String?, message: String?, confirmCompletion: (() -> Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.blue
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
            
            if confirmCompletion != nil
            {
                confirmCompletion!()
            }
        }
        alertController.addAction(OKAction)
        let titAttrString = NSMutableAttributedString(string: title ?? "", attributes: titleAttributes)
        let msgAttrString = NSMutableAttributedString(string: message ?? "", attributes: messageAttributes)
        alertController.setValue(titAttrString, forKey: "attributedTitle")
        alertController.setValue(msgAttrString, forKey: "attributedMessage")
        self.present(alertController, animated: true)
    }
    
    func showConfirmationCancelAlert(title: String?, message: String?, confirmCompletion: (() -> Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.blue
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
            
            if confirmCompletion != nil
            {
                confirmCompletion!()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        let titAttrString = NSMutableAttributedString(string: title ?? "", attributes: titleAttributes)
        let msgAttrString = NSMutableAttributedString(string: message ?? "", attributes: messageAttributes)
        alertController.setValue(titAttrString, forKey: "attributedTitle")
        alertController.setValue(msgAttrString, forKey: "attributedMessage")
        self.present(alertController, animated: true)
    }
    
    func showConfirmationCancelAlert(title: String?, message: String?, confirmCompletion: (() -> Void)?, cancelCompletion: (() -> Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.blue
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
            
            if confirmCompletion != nil
            {
                confirmCompletion!()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            alertController.dismiss(animated: true, completion: nil)
            
            if cancelCompletion != nil
            {
                cancelCompletion!()
            }
        }
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        let titAttrString = NSMutableAttributedString(string: title ?? "", attributes: titleAttributes)
        let msgAttrString = NSMutableAttributedString(string: message ?? "", attributes: messageAttributes)
        alertController.setValue(titAttrString, forKey: "attributedTitle")
        alertController.setValue(msgAttrString, forKey: "attributedMessage")
        self.present(alertController, animated: true)
    }
    
    func showConfirmationCancelAlertWithText(OkButtonTitle:String, CancelButttonTitle:String, title: String?, message: String?, placeholder:String?, keyboardType:UIKeyboardType, confirmCompletion: ((UITextField) -> Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.blue
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = placeholder
            textField.keyboardType = keyboardType
        }
        
        let OKAction = UIAlertAction(title: OkButtonTitle, style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
            
            let firstTextField = alertController.textFields![0] as UITextField
            
            if confirmCompletion != nil
            {
                confirmCompletion!(firstTextField)
            }
        }
        
        let cancelAction = UIAlertAction(title: CancelButttonTitle, style: .cancel, handler: nil)
        
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        
        let titAttrString = NSMutableAttributedString(string: title ?? "", attributes: titleAttributes)
        let msgAttrString = NSMutableAttributedString(string: message ?? "", attributes: messageAttributes)
        alertController.setValue(titAttrString, forKey: "attributedTitle")
        alertController.setValue(msgAttrString, forKey: "attributedMessage")
        
        self.present(alertController, animated: true)
    }
    
    func emptyState(emptyStateMessage:String, emptyStateImageName:String, emptyStateButtonText:String, containerView:UIView, buttonAction: ((UIButton) -> Void)? ) -> EmptyStateManager {
        
        for view in containerView.subviews{
            if  view as? EmptyStateView != nil {
                view.removeFromSuperview()
            }
        }
        
        
        let emptyStateImageConfig = UIImage.SymbolConfiguration(pointSize: 70, weight: .ultraLight, scale: .large)
        
        let esv = EmptyStateView(
            messageText: emptyStateMessage,
            titleText: "",
            
            image: UIImage(systemName: emptyStateImageName, withConfiguration: emptyStateImageConfig),
            buttonText: emptyStateButtonText,
            centerYOffset: -30
        )
        esv.buttonAction = buttonAction
        
        let manager = EmptyStateManager(
            containerView: containerView,
            emptyView: esv,
            animationConfiguration: .init(animationType: .spring)
        )
        
        let color = CMColor.theme.value
        
        esv.messageLabel.textColor = color
        
        esv.imageView.tintColor = color
        
        esv.messageLabel.font = AppFont().largeSize
        
        if let txt = esv.button.titleLabel?.text, !txt.isEmpty {
            esv.button.setTitleColor(UIColor.white, for: .normal)
            esv.button.titleLabel?.font = AppFont().largeSize
            esv.button.backgroundColor = CMColor.theme.value
            esv.button.layer.cornerRadius = 5
            esv.button.widthAnchor.constraint(equalToConstant: 150).isActive = true
            esv.button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }else{
            esv.button.removeFromSuperview()
        }
        
        return manager
    }
    
}
