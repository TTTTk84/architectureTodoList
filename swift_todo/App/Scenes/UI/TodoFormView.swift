//
//  TodoFormView.swift
//  swift_todo
//
//  Created by tk84 on 2021/08/24.
//

import UIKit

protocol TodoFormViewProtocol {
    func tappedSendButton(sendText: String)
}


class TodoFormView: UIView {

    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .lightGray
        return textField
    }()
    let sendBtn: UIButton = {
        let sendBtn = UIButton()
        sendBtn.translatesAutoresizingMaskIntoConstraints = false
        sendBtn.setTitle("送  信", for: .normal)
        sendBtn.backgroundColor = .green
        sendBtn.setTitleColor(.white, for: .normal)
        return sendBtn
    }()
    var view: TodoFormViewProtocol!


    func setupValue(name: String, view: TodoFormViewProtocol) {

        self.backgroundColor = .white
        self.view = view
        self.frame = CGRect(x: 0, y: 0, width: widthValue, height: heightValue)
        self.addSubview(textField)
        self.addSubview(sendBtn)
        self.textField.text = name


        setupLayout()
    }

    private func setupLayout() {

        self.textField.topAnchor.constraint(equalTo: self.topAnchor, constant: widthValue * 0.2).isActive = true
        self.textField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.textField.widthAnchor.constraint(equalToConstant: widthValue * 0.8).isActive = true

        self.sendBtn.translatesAutoresizingMaskIntoConstraints = false
        self.sendBtn.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: widthValue * 0.2).isActive = true
        self.sendBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.sendBtn.widthAnchor.constraint(equalToConstant: widthValue * 0.8).isActive = true
        self.sendBtn.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
    }

    @objc func tappedSendButton() {
        guard let sendText = self.textField.text else {
            return
        }

        view.tappedSendButton(sendText: sendText)
    }
}
