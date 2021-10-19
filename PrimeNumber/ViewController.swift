//
//  ViewController.swift
//  PrimeNumber
//
//  Created by Ting on 2021/10/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBAction func doThePrimeTest(_ sender: UIButton) {
        //1.take out the number string from the inputTextField
        if let inputText = inputTextField.text, let inputNumber = Int(inputText){
        //2.convert the number string to Int
        //3.Using the checkPrime function to get result
        //4.Using the resultLabel to show result
                checkPrime(withNumber: inputNumber) {
                    self.resultLabel.text = $0
                    self.resultLabel.isHidden = false
                }
            }
    
        inputTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //讓鍵盤出現
        inputTextField.becomeFirstResponder()
    }
    func checkPrime(withNumber testNumber:Int)->String{
        var isPrime:Bool? = true
        
        if testNumber <= 0{
            isPrime = nil
        }else if testNumber == 1{
                isPrime = false
        }else{
            for i in 2..<testNumber{
                if testNumber % i == 0{
                    // inputNumber is not prime
                    isPrime = false
                    break
                }
            }
        }
        if isPrime == true{
            return "\(testNumber) is prime"
        }else if isPrime == false{
            return "\(testNumber) is not prime"
        }else{
            return "Please enter a number greater than 0"
        }
    }
    func checkPrime(withNumber number:Int, andCompletionHandler handler:(String)->()){
    handler(checkPrime(withNumber: number))
    }

}

