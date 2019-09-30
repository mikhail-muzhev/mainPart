//
//  VideoView.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 30/09/2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

protocol VideoViewDelegate: class {
    func videoViewDidFinishPlaying()
}

class VideoView: UIView {

    weak var delegate: VideoViewDelegate?

    private var playerLayer: AVPlayerLayer
    private var player: AVPlayer

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    init(filePath: String) {
        player = AVPlayer(url: URL(fileURLWithPath: filePath))
        playerLayer = AVPlayerLayer(player: player)
        super.init(frame: .zero)
        
        layer.addSublayer(playerLayer)
        configureNotificationCenter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playVideo() {
        player.play()
    }

    private func configureNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }

    @objc private func playerDidFinishPlaying() {
        delegate?.videoViewDidFinishPlaying()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        playerLayer.frame = bounds
    }
}
