//
//  ARViewController.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 09.10.2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import ARKit

class ARViewController: UIViewController {

    private lazy var sceneView: ARSCNView = {
        let sceneView = ARSCNView()
        sceneView.delegate = self
        return sceneView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    private func configureUI() {
        view.addSubview(sceneView)
        sceneView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

extension ARViewController: ARSCNViewDelegate {
    
}
