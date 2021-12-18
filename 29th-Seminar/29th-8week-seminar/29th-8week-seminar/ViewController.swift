//
//  ViewController.swift
//  29th-8week-seminar
//
//  Created by 김수연 on 2021/12/18.
//

import UIKit

import Lottie

class ViewController: UIViewController {

    lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "seminar8-sample")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true

        return animationView
    }()

    var animator: UIViewPropertyAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lottieView)
        //initAnimator()
    }

//    func initAnimator(){
//        animator = UIViewPropertyAnimator(duration: 3,
//                                          curve: .easeInOut){
//            self.testView.frame = CGRect(x: self.view.center.x - 50,
//                                         y: self.view.center.y - 50,
//                                         width: 100,
//                                         height: 100)
//        }
//
//        animator?.addAnimations {
//            self.testView.backgroundColor = .orange
//        }
//
//        animator?.addCompletion { position in
//            print(position.rawValue)
//            print("completion 블록 호출됨")
//        }

        /// 파라미터 변수를 지정하지 않을 경우.
        ///
//        animator?.addCompletion {
//            print($0.rawValue)
//            print("")
//        }
//

    @IBAction func touchUpToStartAnimation(_ sender: Any) {
        lottieView.isHidden = false
        lottieView.play()
//        animator?.startAnimation()
    }
    @IBAction func touchUpToPauseAnimation(_ sender: Any) {
        lottieView.pause()
//        animator?.pauseAnimation()
    }

    @IBAction func touchUpToStopAnimation(_ sender: Any) {
        lottieView.isHidden = true
        lottieView.stop()
//        animator?.stopAnimation(true)
//
//        animator?.stopAnimation(false)
//        animator?.finishAnimation(at: .current)
    }
}

