//
//  FilterCell.swift
//  Guidomia
//
//  Created by omar on 15/1/2023.
//

import UIKit


protocol FilterCellDelegate: AnyObject{
    func didSelectModel(model: String?)
    func didSelectMake(make: String?)
}

class FilterCell: UITableViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var filterLabel: UILabel!
    
    private var picker: UIPickerView!
    private var viewModel: CarsViewModel?
    weak var delegate: FilterCellDelegate?
    private var activeField: UITextField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.backgroundColor = .darkGray
        container.layer.cornerRadius = 8
        container.layer.masksToBounds = true
        filterLabel.textColor = .white
        picker = UIPickerView()
        self.makeTextField.inputView = picker
        self.modelTextField.inputView = picker
        self.makeTextField.delegate = self
        self.modelTextField.delegate = self
        setupToolBar(textField: makeTextField)
        setupToolBar(textField: modelTextField)
    }
    
    func setup(viewModel: CarsViewModel){
        self.picker.dataSource = self
        self.picker.delegate = self
        self.viewModel = viewModel
        
    }
    
    private func setupToolBar(textField: UITextField){
        picker.backgroundColor = .white
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.tintColor = .orange
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Select", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.didTapSelect))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Clear", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.didTapClear))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        textField.inputAccessoryView = toolBar
    }
    
    @objc func didTapSelect() {
        self.activeField?.resignFirstResponder()
        let row = picker.selectedRow(inComponent: 0)
        if self.activeField == self.modelTextField {
            let selected = self.viewModel?.models[row]
            self.activeField?.text = selected
            self.delegate?.didSelectModel(model: selected)
        }
        if self.activeField == self.makeTextField {
            let selected = self.viewModel?.makes[row]
            self.activeField?.text = selected
            self.delegate?.didSelectMake(make: selected)
        }
    }

    @objc func didTapClear() {
        self.activeField?.text = ""
        self.activeField?.resignFirstResponder()
        if self.activeField == self.modelTextField {
            self.delegate?.didSelectModel(model: nil)
        }
        if self.activeField == self.makeTextField {
            self.delegate?.didSelectMake(make: nil)
        }
    }
    
}

extension FilterCell: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField = textField
        self.picker.reloadAllComponents()
        self.picker.selectRow(0, inComponent: 0, animated: false)
    }
}

extension FilterCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if self.activeField == self.makeTextField {
            return self.viewModel?.makes.count ?? 0
        }
        
        if self.activeField == self.modelTextField {
            return self.viewModel?.models.count ?? 0
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if self.activeField == self.makeTextField {
            return self.viewModel?.makes[row]
        }
        
        if self.activeField == self.modelTextField {
            return self.viewModel?.models[row]
        }
        return nil
    }

    
}

