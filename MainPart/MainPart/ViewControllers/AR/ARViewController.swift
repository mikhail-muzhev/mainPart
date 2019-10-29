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
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white05
        view.layer.cornerRadius = 14
        return view
    }()

    private lazy var resultImageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "open"))
        image.clipsToBounds = true
        image.layer.cornerRadius = 14
        return image
    }()

    private lazy var descriptionLabel: AttributedLabel = {
        return AttributedLabel(text: R.string.localizable.ar_description(), style: .blackMediumLeft18)
    }()
    
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
        view.backgroundColor = .background
        title = R.string.localizable.ar_title()
        addSubviews()
        configureConstraints()
    }

    private func addSubviews() {
        backgroundView.addSubview(descriptionLabel)
        view.addSubviews(sceneView, backgroundView)
    }

    private func configureConstraints() {
        sceneView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        backgroundView.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        descriptionLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(12)
        }
    }

}

extension ARViewController: ARSCNViewDelegate {

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        DispatchQueue.main.async {
            self.handleFoundImage(imageAnchor, node)
        }
        
    }

    private func handleFoundImage(_ imageAnchor: ARImageAnchor, _ node: SCNNode) {
      let name = imageAnchor.referenceImage.name!
      print("you found a \(name) image")

      let size = imageAnchor.referenceImage.physicalSize
      if let videoNode = changeDetectedImage(size: size) {
        node.addChildNode(videoNode)
        node.opacity = 1
      }
    }
    
    private func changeDetectedImage(size: CGSize) -> SCNNode? {
        let avMaterial = SCNMaterial()
        let imageView = resultImageView
        DispatchQueue.main.async {
            avMaterial.diffuse.contents = imageView
        }
        let videoPlane = SCNPlane(width: size.width, height: size.height)
        videoPlane.materials = [avMaterial]
        
        let videoNode = SCNNode(geometry: videoPlane)
        videoNode.eulerAngles.x = -.pi / 2
        return videoNode
    }
}
