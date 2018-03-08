import UIKit
import PlaygroundSupport

protocol InformationProtocol{
    func didPressButton(information: String)
}

class Boss:UIViewController{
    var infoProtDelegate:InformationProtocol!
    
    let buttonOne:UIButton = {
        let input = UIButton()
        input.setTitle("Info One", for: .normal)
        input.addTarget(self, action: #selector(ButtonOneClick), for: .touchUpInside)
        return input
    }()
    
    let buttonTwo:UIButton = {
        let input = UIButton()
        input.setTitle("Info Two", for: .normal)
        input.addTarget(self, action: #selector(ButtonTwoClick), for: .touchUpInside)
        return input
    }()
    
    override func viewDidLoad() {
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        setupLayout()
    }
    
    @objc func ButtonOneClick(_ sender:Any?){
        infoProtDelegate.didPressButton(information: "ONE")
        dismiss(animated: true, completion: nil)
    }
    
    @objc func ButtonTwoClick(_ sender:Any?){
        infoProtDelegate.didPressButton(information: "TWO")
        dismiss(animated: true, completion: nil)
    }
    
    private func setupLayout(){
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        buttonOne.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.topAnchor.constraint(equalTo: buttonOne.bottomAnchor).isActive = true
        buttonTwo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
}


class Intern:UIViewController, InformationProtocol{
    var myClickedButtonLabel:UILabel = {
        let label = UILabel()
        label.text = "BUTTON CLICKED"
        return label
    }()
    
    let btnShowBoss:UIButton = {
        let input = UIButton()
        input.setTitle("Show Boss", for: .normal)
        input.setTitleColor(UIColor.black, for: .normal)
        input.addTarget(self, action: #selector(ShowBoss), for: .touchUpInside)
        return input
    }()
    
    @objc func ShowBoss(_ sender:Any?){
        let boss = Boss()
        boss.infoProtDelegate = self
        present(boss, animated: true, completion: nil)
    }
    
    func didPressButton(information: String) {
        myClickedButtonLabel.text = information
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(myClickedButtonLabel)
        view.addSubview(btnShowBoss)
        setupLayout()
    }
    
    private func setupLayout(){
        myClickedButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        myClickedButtonLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myClickedButtonLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        btnShowBoss.translatesAutoresizingMaskIntoConstraints = false
        btnShowBoss.topAnchor.constraint(equalTo: myClickedButtonLabel.bottomAnchor).isActive = true
        btnShowBoss.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
}

PlaygroundPage.current.liveView = Intern()

