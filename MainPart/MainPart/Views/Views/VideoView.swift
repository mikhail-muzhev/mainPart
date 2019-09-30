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

class VideoView: UIView {

    private var playerLayer: AVPlayerLayer
    private var player: AVPlayer

    init(filePath: String) {
        player = AVPlayer(url: URL(fileURLWithPath: filePath))
        playerLayer = AVPlayerLayer(player: player)
        super.init(frame: .zero)
        
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playVideo() {
        player.play()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        playerLayer.frame = bounds
    }
}
