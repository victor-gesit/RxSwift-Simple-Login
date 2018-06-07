//
//  ViewController.swift
//  RxSwift Haville
//
//  Created by Victor Idongesit on 05/06/2018.
//  Copyright © 2018 Victor Idongesit. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginEnabledLabel: UILabel!
    
    let bag = DisposeBag()
    var loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.rx.text.map { $0 ?? ""}
            .bind(to: loginViewModel.emailText)
            .disposed(by: bag)
        passwordTextField.rx.text.map { $0 ?? "" }
            .bind(to: loginViewModel.passwordText)
            .disposed(by: bag)
        loginViewModel.isValid
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: bag)
        
        loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.loginEnabledLabel.text = isValid ? "Enabled" : "Not Enabled"
            self.loginEnabledLabel.textColor = isValid ? .green : .red
            print("isValid: \(isValid)")
        })
        .disposed(by: bag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

