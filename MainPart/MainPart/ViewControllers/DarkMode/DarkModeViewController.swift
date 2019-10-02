//
//  DarkModeViewController.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 02/10/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit

class DarkModeViewController: BaseViewController {

    private lazy var descriptionLabel: AttributedLabel = {
        return AttributedLabel(text: R.string.localizable.dark_mode_description(),
                               style: .blackMediumLeft20)
    }()

    private lazy var nextButton: AttributedButton = {
        let button = AttributedButton(style: .whiteMediumCenter20)
        button.setTitleForAllStates(R.string.localizable.dark_mode_next_title())
        button.addTarget(self, action: #selector(nextButtonDidPressed), for: .touchUpInside)
        return button
    }()

    private lazy var tutorialImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "downArrow").withRenderingMode(.alwaysTemplate))
        imageView.tintColor = .foreground
        return imageView
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
        view.addSubviews(descriptionLabel, tutorialImageView, nextButton)
    }

    private func configureConstraints() {
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(tutorialImageView.snp.leading).offset(-5)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        tutorialImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-5)
            $0.width.height.equalTo(60)
        }
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = R.string.localizable.dark_mode_title()
    }

    @objc private func nextButtonDidPressed() {
        
    }

}
