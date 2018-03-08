//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import UserNotifications
import Darwin

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 500))
        view.backgroundColor = .white
     
        let btn = UIButton()
        btn.setTitle("Send User Notification", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self,action: #selector(btn_click), for: .touchUpInside)
        
        view.addSubview(btn)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        btn.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        btn.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
        //UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (didAllow, error) in
            //    print(didAllow)
            //}
        
        self.view = view
    }
    @objc func btn_click(sender:UIButton){
        print("Button Clicked")
        var num:Double?
        for i in -100...100{
            num = sigmoid(x:Double(i))
            print("\(i) = \(num!)")
        }
    }
    
    func sigmoid(x:Double)->Double{
        return 1 / (1 + pow(M_E,-x))
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
