//
//  ViewController.swift
//  WW2
//
//  Created by Yusuf Çınar on 8.01.2019.
//  Copyright © 2019 Yusuf Çınar. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource  , UITextFieldDelegate{
    /*
      storyboard kullanmadan yaptim.
      Inputlari text dosyasindan cekmek yerine ekran tasarlayip ordan kullanicidan aliyorum.
      Outputlari xcode terminale yazdirdim.
     
     */
    
    var resource : Int?
    var pickerData: [String] = [ "Zombie" ,"Bug","Lion","Mutant","ZombieDog"]
    var pickerSelectedIndex : Int = 0
    var allCharacterArray : [BaseCharacters]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allCharacterArray = [BaseCharacters]()
        setupViews()
    }
    
    //MARK: Define Views
    lazy var scrollView : UIScrollView = {
        let sc = UIScrollView()
        sc.contentSize.height =  2000
        sc.alwaysBounceVertical = false
        sc.alwaysBounceHorizontal = false
        sc.bounces = false
        return sc
    }()
    lazy var containerView : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .purple
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissKeyword)))
        return view
    }()
    lazy var pickerview : UIPickerView = {
        let pv = UIPickerView()
        pv.delegate = self
        pv.dataSource =  self
        pv.backgroundColor = .white
        return pv
    }()
    
    let resourceLabel : UILabel = {
        let label = UILabel()
        label.text = "Resource"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight:UIFont.Weight.semibold)
        return label
    }()
    
    let resourceTextfield : UITextField = {
        let tv = UITextField()
        tv.clearButtonMode = .always
        tv.keyboardType = .numberPad
        tv.layer.cornerRadius = 10
        tv.layer.backgroundColor = UIColor.black.cgColor
        tv.layer.masksToBounds = true
        tv.backgroundColor = .white
        tv.borderStyle = .roundedRect
        tv.layer.borderWidth = 2
        tv.textColor = .black
        return tv
    }()
    let heroAttackLabel : UILabel = {
        let label = UILabel()
        label.text = "Hero Attack"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight:UIFont.Weight.semibold)
        return label
    }()
    
    let heroAttactTextfield : UITextField = {
        let tv = UITextField()
        tv.clearButtonMode = .always
        tv.keyboardType = .numberPad
        tv.layer.cornerRadius = 10
        tv.layer.backgroundColor = UIColor.black.cgColor
        tv.layer.masksToBounds = true
        tv.backgroundColor = .white
        tv.borderStyle = .roundedRect
        tv.layer.borderWidth = 2
        tv.textColor = .black
        return tv
    }()
    let heroHealthyLabel : UILabel = {
        let label = UILabel()
        label.text = "Hero Healthy"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight:UIFont.Weight.semibold)
        return label
    }()
    
    let heroHealthyTextfield : UITextField = {
        let tv = UITextField()
        tv.clearButtonMode = .always
        tv.keyboardType = .numberPad
        tv.layer.cornerRadius = 10
        tv.layer.backgroundColor = UIColor.black.cgColor
        tv.layer.masksToBounds = true
        tv.backgroundColor = .white
        tv.borderStyle = .roundedRect
        tv.layer.borderWidth = 2
        tv.textColor = .black
        return tv
    }()
    let heroCreatedLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight:UIFont.Weight.semibold)
        return label
    }()
    lazy var createHeroButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Hero", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(handleCreateHero), for: .touchUpInside)
        return button
    }()
    let enemyAttackLabel : UILabel = {
        let label = UILabel()
        label.text = "Enemy Attack"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight:UIFont.Weight.semibold)
        return label
    }()
    
    let enemyAttactTextfield : UITextField = {
        let tv = UITextField()
        tv.clearButtonMode = .always
        tv.keyboardType = .numberPad
        tv.layer.cornerRadius = 10
        tv.layer.backgroundColor = UIColor.black.cgColor
        tv.layer.masksToBounds = true
        tv.backgroundColor = .white
        tv.borderStyle = .roundedRect
        tv.layer.borderWidth = 2
        tv.textColor = .black
        return tv
    }()
    let enemyHealthyLabel : UILabel = {
        let label = UILabel()
        label.text = "Enemy Healthy"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight:UIFont.Weight.semibold)
        return label
    }()
    
    let enemyHealthyTextfield : UITextField = {
        let tv = UITextField()
        tv.clearButtonMode = .always
        tv.keyboardType = .numberPad
        tv.layer.cornerRadius = 10
        tv.layer.backgroundColor = UIColor.black.cgColor
        tv.layer.masksToBounds = true
        tv.backgroundColor = .white
        tv.borderStyle = .roundedRect
        tv.layer.borderWidth = 2
        tv.textColor = .black
        return tv
    }()
    let enemyLocationLabel : UILabel = {
        let label = UILabel()
        label.text = "Enemy Location"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight:UIFont.Weight.semibold)
        return label
    }()
    
    let enemyLocationTextfield : UITextField = {
        let tv = UITextField()
        tv.clearButtonMode = .always
        tv.keyboardType = .numberPad
        tv.layer.cornerRadius = 10
        tv.layer.backgroundColor = UIColor.black.cgColor
        tv.layer.masksToBounds = true
        tv.backgroundColor = .white
        tv.borderStyle = .roundedRect
        tv.layer.borderWidth = 2
        tv.textColor = .black
        return tv
    }()
    
    let enemyTypeLabel : UILabel = {
        let label = UILabel()
        label.text = "Enemy Type"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight:UIFont.Weight.semibold)
        return label
    }()
    lazy var enemyTypeTextfield : UITextField = {
        let tv = UITextField()
        tv.clearButtonMode = .always
        tv.text = pickerData.first
        tv.layer.cornerRadius = 10
        tv.delegate = self
        tv.layer.backgroundColor = UIColor.black.cgColor
        tv.layer.masksToBounds = true
        tv.backgroundColor = .white
        tv.borderStyle = .roundedRect
        tv.layer.borderWidth = 2
        tv.textColor = .black
        return tv
    }()
    
    let enemyCreatedLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight:UIFont.Weight.semibold)
        return label
    }()
    lazy var createEnemyButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Enemy", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(handleCreateEnemy), for: .touchUpInside)
        return button
    }()
    lazy var startWarButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start War", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor = .black
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(handleStartWar), for: .touchUpInside)
        return button
    }()
    
    //MARK:Handle
    @objc func handleDismissKeyword (){
        self.view.endEditing(true)
    }
    
    // kahraman olusturuldu.
    @objc func handleCreateHero(){
        
        guard let healthString = self.heroHealthyTextfield.text  , let attactString = self.heroAttactTextfield.text , let resourceString = self.resourceTextfield.text else { return  }
        let hero = Hero(healthy:healthString.toInt() , location: 0, attackPoint:attactString.toInt() )
        heroCreatedLabel.text = "Hero Created ..."
        self.resource = resourceString.toInt()
        allCharacterArray?.append(hero)
        reloadHeroAllTextfield()
    }
    //Dusman olusturuldu.
    @objc func handleCreateEnemy(){
        guard let healthString = self.enemyHealthyTextfield.text  , let attactString = self.enemyAttactTextfield.text , let locationString = self.enemyLocationTextfield.text else { return  }
        
        let typeCharacter = Helper.createRandomCharacters(index: self.pickerSelectedIndex)
        
        var enemy : BaseCharacters?
        switch typeCharacter {
        case .zombie:
            enemy = Zombie(healthy: healthString.toInt() , location: locationString.toInt(), attackPoint: attactString.toInt())
        case .bug:
            enemy = Bug(healthy: healthString.toInt() , location: locationString.toInt(), attackPoint: attactString.toInt())
        case .mutant:
            enemy = Mutant(healthy: healthString.toInt() , location: locationString.toInt(), attackPoint: attactString.toInt())
        case .zombieDog:
            enemy = ZombieDog(healthy: healthString.toInt() , location: locationString.toInt(), attackPoint: attactString.toInt())
        case .lion:
            enemy = Lion(healthy: healthString.toInt() , location: locationString.toInt(), attackPoint: attactString.toInt())
        default :
            enemy = BaseCharacters(name: "Base", healthy: healthString.toInt() , location: locationString.toInt(), attactPoint: attactString.toInt())
        }
        
        if let newEnemy = enemy {
            allCharacterArray?.append(newEnemy)
            enemyCreatedLabel.text = " \(newEnemy.stringName) added."
        }
        self.reloadEnemyAllTextfield()
    }
    
    fileprivate func reloadEnemyAllTextfield(){
        self.enemyHealthyTextfield.text = nil
        self.enemyTypeLabel.text = pickerData.first
        self.enemyLocationTextfield.text = nil
        self.enemyAttactTextfield.text = nil
    }
    fileprivate func reloadHeroAllTextfield(){
        self.heroHealthyTextfield.text = nil
        self.heroAttactTextfield.text = nil
        self.resourceTextfield.text = nil
    }
    
    @objc func handleStartWar()  {
        
        guard let arr = self.allCharacterArray else { return  }
        
        let sortedArray = Helper.sortedCharacters(arr: arr)
        let myHeroandEnemy = Helper.removeHeroAllCharactersArray(arr: sortedArray)
        let warManager = WarManager()
        
        guard let myHero = myHeroandEnemy.0 , let enemyArray = myHeroandEnemy.1 else { return }
        let result =  warManager.startWarWithAllEnemy(resource: self.resource ?? 5000, myHero: myHero, enemyArray: enemyArray )
        
        if result {
            print("Hero is Survived!")
        }
        else {
            print("Hero is Dead!! Last seen at position \(myHero.location) !!")
        }
        
        self.allCharacterArray?.removeAll()
        self.enemyCreatedLabel.text = nil
        self.heroCreatedLabel.text = nil
    }
    
    //MARK : Setup Views
    
    func setupViews() {
        
        setupAddView()
        setupAddAnchor()
        setupScrollView()
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
        
    }
    fileprivate func setupAddView()  {
        self.view.addSubview(scrollView)
        self.view.addSubview(startWarButton)
    }
    fileprivate func setupAddAnchor() {
        
        scrollView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.safeAreaLayoutGuide.leftAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingleft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, centerX: nil, centerY: nil)
        startWarButton.anchor(top: nil, left: self.view.safeAreaLayoutGuide.leftAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingleft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60, centerX: nil, centerY: nil)
        
    }
    fileprivate func setupScrollView(){
        
        containerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1000)
        scrollView.addSubview(containerView)
        
        setupAddContainerView()
        setupAddAnchorContainerView()
    }
    fileprivate func setupAddContainerView(){
        
        //Hero Items
        
        containerView.addSubview(resourceLabel)
        containerView.addSubview(resourceTextfield)
        containerView.addSubview(heroAttackLabel)
        containerView.addSubview(heroAttactTextfield)
        containerView.addSubview(heroHealthyLabel)
        containerView.addSubview(heroHealthyTextfield)
        containerView.addSubview(heroCreatedLabel)
        containerView.addSubview(createHeroButton)
        
        // Enemy Items
        containerView.addSubview(enemyTypeLabel)
        containerView.addSubview(enemyTypeTextfield)
        containerView.addSubview(enemyHealthyLabel)
        containerView.addSubview(enemyHealthyTextfield)
        containerView.addSubview(enemyLocationLabel)
        containerView.addSubview(enemyLocationTextfield)
        containerView.addSubview(enemyAttackLabel)
        containerView.addSubview(enemyAttactTextfield)
        containerView.addSubview(enemyCreatedLabel)
        containerView.addSubview(createEnemyButton)
    }
    
    fileprivate func setupAddAnchorContainerView(){
        
        //Hero Items
        resourceLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 100, height: 30, centerX: nil, centerY: nil)
        resourceTextfield.anchor(top: containerView.topAnchor, left: resourceLabel.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 50, paddingleft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 30, centerX: nil, centerY: nil)
        
        heroAttackLabel.anchor(top: resourceLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingleft: 10, paddingBottom: 10, paddingRight: 0, width: 100, height: 30, centerX: nil, centerY: nil)
        heroAttactTextfield.anchor(top: resourceLabel.bottomAnchor, left: heroAttackLabel.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingleft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 30, centerX: nil, centerY: nil)
        
        
        heroHealthyLabel.anchor(top: heroAttackLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingleft: 10, paddingBottom: 10, paddingRight: 0, width: 100, height: 30, centerX: nil, centerY: nil)
        heroHealthyTextfield.anchor(top: heroAttackLabel.bottomAnchor, left: heroHealthyLabel.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingleft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 30, centerX: nil, centerY: nil)
        
        
        heroCreatedLabel.anchor(top: heroHealthyLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 200, height: 30, centerX: nil, centerY: nil)
        createHeroButton.anchor(top: heroHealthyLabel.bottomAnchor, left: heroCreatedLabel.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingleft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 30, centerX: nil, centerY: nil)
        
        
        // Enemy Items
        enemyTypeLabel.anchor(top: heroCreatedLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 60, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 200, height: 30, centerX: nil, centerY: nil)
        enemyTypeTextfield.anchor(top: heroCreatedLabel.bottomAnchor, left: enemyTypeLabel.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 60, paddingleft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 30, centerX: nil, centerY: nil)
        
        enemyLocationLabel.anchor(top: enemyTypeLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 200, height: 30, centerX: nil, centerY: nil)
        enemyLocationTextfield.anchor(top: enemyTypeLabel.bottomAnchor, left: enemyLocationLabel.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingleft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 30, centerX: nil, centerY: nil)
        
        
        enemyAttackLabel.anchor(top: enemyLocationLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 200, height: 30, centerX: nil, centerY: nil)
        enemyAttactTextfield.anchor(top: enemyLocationLabel.bottomAnchor, left: enemyAttackLabel.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingleft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 30, centerX: nil, centerY: nil)
        
        
        enemyHealthyLabel.anchor(top: enemyAttackLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 200, height: 30, centerX: nil, centerY: nil)
        enemyHealthyTextfield.anchor(top: enemyAttackLabel.bottomAnchor, left: enemyHealthyLabel.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingleft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 30, centerX: nil, centerY: nil)
        
        
        enemyCreatedLabel.anchor(top: enemyHealthyLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 200, height: 30, centerX: nil, centerY: nil)
        createEnemyButton.anchor(top: enemyHealthyLabel.bottomAnchor, left: enemyCreatedLabel.rightAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingleft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 30, centerX: nil, centerY: nil)
    }
  
    //MARK: PickerView Delegate DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerSelectedIndex = row
        self.enemyTypeTextfield.text = pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //MARK : UITextfield Delegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.enemyTypeTextfield {
            self.enemyTypeTextfield.inputView = pickerview
            pickerview.reloadAllComponents()
            pickerview.selectedRow(inComponent: 0)
        }
        return true
    }
    
}





