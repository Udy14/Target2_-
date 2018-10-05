//
//  AddViewController.swift
//  Target2
//
//  Created by Yuji Ishikawa on 2018/10/04.
//  Copyright © 2018年 Yuji Ishikawa. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderArray[row]
    }
    
    @IBOutlet var textfield: UITextField!
    @IBOutlet var gendertextfield: UITextField!
    @IBOutlet var agetextfield: UITextField!
    
    var pickerView: UIPickerView = UIPickerView()
    let genderArray: [String] = ["男性", "女性", "その他"]
    let ageArray: [String] = ["10代", "20代", "30代", "40代", "50代", "60代", "70代以上"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spaceItem, doneItem], animated: true)
        
        gendertextfield.inputView = pickerView
        gendertextfield.inputAccessoryView = toolbar
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
    
    @objc func done(){
        gendertextfield.endEditing(true)
        gendertextfield.text = "\(genderArray[pickerView.selectedRow(inComponent: 0)])"
    }
}
