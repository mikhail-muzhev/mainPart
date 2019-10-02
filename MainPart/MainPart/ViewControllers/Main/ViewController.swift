//
//  ViewController.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 26/09/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit
import AVKit


class ViewController: BaseViewController {

    // MARK: - Views

    private var videoView: VideoView = {
        let videoView = VideoView(filePath: Bundle.main.path(forResource: "intro", ofType: "mp4")!)
        videoView.alpha = 0
        return videoView
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.isHidden = true
        return view
    }()

    private lazy var titleLabel: AttributedLabel = {
        let label = AttributedLabel(text: R.string.localizable.main_intro_title(),
                                    style: LabelStyle.blackBoldLeft32)
        return label
    }()

    private lazy var descriptionLabel: AttributedLabel = {
        let label = AttributedLabel(text: R.string.localizable.main_intro_description(),
                                    style: .blackMediumLeft20)
        return label
    }()

    private lazy var okButton: AttributedButton = {
        let button = AttributedButton(style: .whiteMediumCenter20)
        button.setTitleForAllStates(R.string.localizable.main_intro_ok_button_title())
        button.addTarget(self, action: #selector(okButtonDidPressed), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lawyerInPocketMainGray.cgColor
        button.backgroundColor = .lawyerInPocketEmerald
        button.layer.cornerRadius = 10
        return button
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        videoView.delegate = self
        makeConstraints()
        animateVideoViewAppearing()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - UI settings

    private func addSubviews() {
        view.addSubviews(videoView, backgroundView)
        backgroundView.addSubviews(titleLabel, descriptionLabel, okButton)
    }

    private func makeConstraints() {
        videoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-12)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-12)
        }
        okButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-60)
            $0.height.equalTo(54)
            $0.leading.equalToSuperview().offset(20)
        }
    }

    // MARK: - Animations

    private func animateVideoViewAppearing() {
           UIView.animate(withDuration: 1, animations: { [weak videoView] in
               videoView?.alpha = 1
           }, completion: { [weak videoView] isCompleted in
               videoView?.playVideo()
           })
       }

       private func animateBackgroundViewAppearing() {
           backgroundView.isHidden = false
           view.bringSubviewToFront(backgroundView)
           UIView.animate(withDuration: 1, animations: { [weak backgroundView] in
               backgroundView?.alpha = 1
           })
       }

    // MARK: - Actions

    @objc private func okButtonDidPressed() {
        let viewController = DarkModeViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension ViewController: VideoViewDelegate {

    func videoViewDidFinishPlaying() {
        animateBackgroundViewAppearing()
    }
    
}
