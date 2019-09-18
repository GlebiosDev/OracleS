//
//  SettingsViewController.swift
//  Oracles
//
//  Created by Macbook Pro on 28.08.2019.
//  Copyright © 2019 GlebSerediuk. All rights reserved.
//

import UIKit
import UserNotifications

class SettingsViewController: UIViewController,DataEnteredDelegate,DateGenderDelegate, DateStatusDelegate,DateDataDelegate, DateTimeDelegate, UNUserNotificationCenterDelegate {
    
    func userDidEnteredInformation(time: String) {
        timeUserSettings.text = time
        print("timeUser = time")
    }
    
    func userDidEnteredInformation(date: String) {
        dateUserSettings.text = date
           Singleton.shared.dateUser = dateUserSettings.text!
        print("dateUser = date")
        
    }
    
    func userDidEnteredInformation(status: String) {
        
        statusUserSettings.text = status
        Singleton.shared.statusUser = statusUserSettings.text!
        print("statusUser = status")
        
    }
    
    func userDidEnteredInformation(gender: String) {
        genderUserSettings.text = gender
        Singleton.shared.genderUser = genderUserSettings.text!

        print("genderUser = gender")
    }
    
    func userDidEnterInformation(info: String) {
        nameUserSettings.text = info
        Singleton.shared.nameUser = nameUserSettings.text!
        print("nameUser = gender = info")
    }
    
    
    @IBOutlet weak var nameUserSettings: UILabel!
    
    @IBOutlet weak var genderUserSettings: UILabel!
    
    @IBOutlet weak var statusUserSettings: UILabel!
    
    @IBOutlet weak var dateUserSettings: UILabel!
    
    @IBOutlet weak var timeUserSettings: UILabel!
    
    @IBOutlet weak var zodizImageOutlet: UIImageView!
    
    @IBOutlet weak var nameUserTitle: UILabel!
    
    @IBOutlet weak var zodiacLabelOutlet: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeNameVCid" {
            let changeNameVc = segue.destination as! changeNameVC
            changeNameVc.delegate = self
            
            
        }
        if segue.identifier == "changeGenderVCid" {
            let changeGendereVc = segue.destination as! changeGenderVC
            changeGendereVc.delegate = self
            
            
        }
        if segue.identifier == "changeStatusVCid" {
            let changeStatusVc = segue.destination as! changeStatusVC
            changeStatusVc.delegate = self
            
            
        }
        if segue.identifier == "changeDateVCid"{
            let changeDateVc = segue.destination as! changeDateVC
            changeDateVc.delegate = self
            
            
        }
        if segue.identifier == "changeTimeVCid"{
            let changeTimeVc = segue.destination as! changeTimeVC
            changeTimeVc.delegate = self
            
            
        }
        
        
    }
    
    @IBOutlet weak var switchPushOutlet: UISwitch!
    @IBAction func switchPushAction(_ sender: UISwitch) {
        print(" switch IF ")
        if(sender.isOn){
            print("on")
            UIApplication.shared.registerForRemoteNotifications()
        }
        else{
            print("Off")
            UIApplication.shared.unregisterForRemoteNotifications()
        }
        
    }
    
    
    
    //Передаю значения в лейбл на viewSettings
  
    func textSetting()
    {
       
     
        dateUserSettings.text = Singleton.shared.dateUser
        timeUserSettings.text = Singleton.shared.timeUser
        genderUserSettings.text = Singleton.shared.genderUser
        statusUserSettings.text = Singleton.shared.statusUser
        nameUserSettings.text = Singleton.shared.nameUser
        zodizImageOutlet.image = Singleton.shared.zodiacImage
        nameUserTitle.text = Singleton.shared.nameUser
        zodiacLabelOutlet.text = Singleton.shared.zodiacUser
       
            saveSettings()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad start ")
       
        textSetting()
         getSettings()
        switchPushOutlet.onTintColor = .blue
        switchPushOutlet.tintColor = .red
        setupNavBar()
        
    }
    
    //хранение информации пользователя
    let defaults = UserDefaults.standard
    enum Key {
    static let dateUser = "settingsDateUser"
   static let timeUser = "settingsTimeUser"
   static let genderUser = "settingsGenderUser"
   static let statusUser = "settingsStatusUser"
   static let nameUser = "settingsNameUser"
    }
    func saveSettings()
    {
        
        
        defaults.set(dateUserSettings.text, forKey: Key.dateUser)
        defaults.set( timeUserSettings.text , forKey: Key.timeUser)
        defaults.set(genderUserSettings.text, forKey: Key.genderUser)
        defaults.set( statusUserSettings.text, forKey: Key.statusUser)
        defaults.set(nameUserSettings.text, forKey: Key.nameUser)
        
    }
   
  
 
    
    func getSettings() {
        dateUserSettings.text =  defaults.string(forKey: Key.dateUser)
        timeUserSettings.text =  defaults.string(forKey: Key.timeUser)
        genderUserSettings.text =  defaults.string(forKey: Key.genderUser)
        statusUserSettings.text =  defaults.string(forKey: Key.statusUser)
        nameUserSettings.text =  defaults.string(forKey: Key.nameUser)
        print("GetName Finish Settings")
    }
    
    
    func setupNavBar()
    {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        
        
    }
    override  func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}




