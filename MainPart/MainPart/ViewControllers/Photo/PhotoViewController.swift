//
//  PhotoViewController.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 04/10/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit

class PhotoViewController: BaseViewController {

    private lazy var descriptionLabel: AttributedLabel = {
        return AttributedLabel(text: R.string.localizable.photo_description(),
                               style: .blackMediumLeft20)
    }()

    private lazy var nextButton: AttributedButton = {
        let button = AttributedButton(style: .whiteMediumCenter20)
        button.setTitleForAllStates(R.string.localizable.dark_mode_next_title())
        button.addTarget(self, action: #selector(nextButtonDidPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()

    private lazy var cameraButton: UIButton = {
        let button = UIButton()
        
        button.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
        button.addTarget(self, action: #selector(cameraButtonDidPressed), for: .touchUpInside)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()

    private lazy var imageView: UIImageView = {
        return UIImageView(image: #imageLiteral(resourceName: "avocado"))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        addSubviews()
        configureConstraints()
        configureNavigationBar()
        view.backgroundColor = .background
    }

    private func addSubviews() {
        view.addSubviews(descriptionLabel, nextButton, cameraButton)
    }

    private func configureConstraints() {
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-5)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        cameraButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(cameraButton.snp.height).multipliedBy(1 / 1)
            $0.bottom.lessThanOrEqualTo(nextButton.snp.top).offset(-20)
        }
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = R.string.localizable.photo_title()
    }

    @objc private func cameraButtonDidPressed() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = .camera
        present(myPickerController, animated: true)
    }

    @objc private func nextButtonDidPressed() {
        
    }

}

extension PhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        cameraButton.imageView?.contentMode = .scaleAspectFit
        cameraButton.setImage(image, for: .normal)
        nextButton.isHidden = false
        descriptionLabel.text = R.string.localizable.photo_done_description()
        picker.dismiss(animated: true)
    }

}
