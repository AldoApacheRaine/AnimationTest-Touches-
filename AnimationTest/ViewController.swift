//
//  ViewController.swift
//  AnimationTest
//
//  Created by PaLiarMo on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var dragging = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first?.location(in: self.view) {
            print("touch \(touch)")
            if isTapedToImage(touch) {
                dragging = true
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dragging = false
        if let touch = touches.first?.location(in: self.view) {
            print("touchesEnded \(touch)")
            if isTapedToImage(touch) {
                UIView.animate(withDuration: 1) {
                    self.imageView.frame.origin.x = touch.x - (self.imageView.frame.size.width/2)
                    self.imageView.frame.origin.y = self.view.frame.maxY - self.imageView.frame.size.height
                }
            } else {
                UIView.animate(withDuration: 1) {
                    self.imageView.frame.origin.x = touch.x - (self.imageView.frame.size.width/2)
                    self.imageView.frame.origin.y = touch.y - (self.imageView.frame.size.height/2)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (dragging){
            if let touch = touches.first?.location(in: self.view){
                print("touchesMoved \(touch)")
                imageView.frame.origin.x = touch.x - (imageView.frame.size.width/2)
                imageView.frame.origin.y = touch.y - (imageView.frame.size.height/2)
            }
        }
    }

    private func isTapedToImage(_ touch: CGPoint) -> Bool {
        imageView.frame.contains(touch) ? true : false
    }
}

