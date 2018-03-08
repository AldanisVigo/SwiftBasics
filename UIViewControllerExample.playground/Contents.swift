//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class ViewController: UIViewController{
    let nextBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Next View", for: .normal)
        btn.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        return btn
    }()
    
    @objc func nextView(){
        let next = ViewControllerTwo()
        present(next, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .green
        view.addSubview(nextBtn)
        setupLayout()
    }
    
    func setupLayout(){
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        nextBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        nextBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

class ViewControllerTwo: UIViewController{
    override func viewDidLoad(){
        view.backgroundColor = .red
    }
}


PlaygroundPage.current.liveView = ViewController()
