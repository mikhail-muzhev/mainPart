//
//  ARViewController.swift
//  MainPart
//
//  Created by Mikhail Muzhev on 09.10.2019.
//  Copyright © 2019 Live Typing. All rights reserved.
//

import ARKit

class ARViewController: UIViewController {

    private var imageConfiguration: ARImageTrackingConfiguration?
    
    private lazy var sceneView: ARSCNView = {
        let sceneView = ARSCNView()
        sceneView.delegate = self
        return sceneView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        setupImageDetection()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let configuration = imageConfiguration else { return }
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        sceneView.session.pause()
    }

    private func setupImageDetection() {
        imageConfiguration = ARImageTrackingConfiguration()
        guard let referenceImages = ARReferenceImage.referenceImages( inGroupNamed: "AR Images", bundle: nil) else { fatalError("Missing expected asset catalog resources.") }
        imageConfiguration?.trackingImages = referenceImages
    }

    private func configureUI() {
        view.addSubview(sceneView)
        sceneView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

extension ARViewController: ARSCNViewDelegate {

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        handleFoundImage(imageAnchor, node)
    }

    private func handleFoundImage(_ imageAnchor: ARImageAnchor, _ node: SCNNode) {
      let name = imageAnchor.referenceImage.name!
      print("you found a \(name) image")

      let size = imageAnchor.referenceImage.physicalSize
      if let videoNode = makeDinosaurVideo(size: size) {
        node.addChildNode(videoNode)
        node.opacity = 1
      }
    }
    
    private func makeDinosaurVideo(size: CGSize) -> SCNNode? {
        
        let avMaterial = SCNMaterial()
        DispatchQueue.main.async {
            avMaterial.diffuse.contents = UIImageView(image: #imageLiteral(resourceName: "avocado"))
        }
        
        let videoPlane = SCNPlane(width: size.width, height: size.height)
        videoPlane.materials = [avMaterial]
        
        let videoNode = SCNNode(geometry: videoPlane)
        videoNode.eulerAngles.x = -.pi / 2
        return videoNode
    }
}
