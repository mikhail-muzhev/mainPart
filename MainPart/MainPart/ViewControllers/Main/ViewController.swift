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
        return videoView
    }()

    private var playerLayer: AVPlayerLayer?

    private lazy var titleLabel: AttributedLabel = {
        return AttributedLabel(text: "", style: .blackMediumLeft17)
    }()

    private lazy var okButton: AttributedButton = {
        let button = AttributedButton(style: .lightGreenMediumCenter17)
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
        videoView.playVideo()
    }

    private func addSubviews() {
        view.addSubviews(videoView, titleLabel, okButton)
    }

    private func makeConstraints() {
        videoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    @objc private func okButtonDidPressed() {
        
    }

}

