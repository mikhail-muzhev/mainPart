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

    private var videoView: VideoView = {
        let videoView = VideoView(filePath: Bundle.main.path(forResource: "intro", ofType: "mp4")!)
        videoView.alpha = 0
        return videoView
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        view.alpha = 0
        view.isHidden = true
        return view
    }()

    private lazy var titleLabel: AttributedLabel = {
        return AttributedLabel(text: "Text", style: .blackMediumLeft17)
    }()

    private lazy var okButton: AttributedButton = {
        let button = AttributedButton(style: .lightGreenMediumCenter17)
        button.setTitleForAllStates("Button")
        button.addTarget(self, action: #selector(okButtonDidPressed), for: .touchUpInside)
        return button
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        makeConstraints()
        animateVideoViewAppearing()
    }

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

    private func addSubviews() {
        videoView.delegate = self
        view.addSubviews(videoView, backgroundView)
        backgroundView.addSubviews(titleLabel, okButton)
    }

    private func makeConstraints() {
        videoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        okButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }

    @objc private func okButtonDidPressed() {
        
    }

    

}

extension ViewController: VideoViewDelegate {

    func videoViewDidFinishPlaying() {
        animateBackgroundViewAppearing()
    }
    
}
