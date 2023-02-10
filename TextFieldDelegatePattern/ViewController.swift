//
//  ViewController.swift
//  TextFieldDelegatePattern
//
//  Created by 하연주 on 2023/02/09.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
        
        textField.becomeFirstResponder() //화면에 들어오자마자 키보드가 올라오도록 만들어줌
    }
    
    //화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //or
        //textField.resignFirstResponder()
    }

    //🍑 델리게이트 메서드들 정리
    /*
    //텍스트 필드가 입력을 시작할 때 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        print("textFieldShouldBeginEditing")
        return true
    }
    
    //텍스트필드의 입력이 시작한 시점!!
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    //입력한 텍스트를 clear할 수 있는지 여부
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    //텍스트필드 글자 내용이 (한글자 한글자) 입력되거나 지워질 때 호출 - character단위로 입력/삭제할 것인지 여부
    //true 리턴하면 한글자한글자 써지고 지워짐 (써지고 지워질 때마다 호출)
    //false 리턴하면 더이상 안써지고 안지워짐
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("shouldChangeCharactersIn => ", textField.text)
        //4글자 넘게 썼으면 더이상 수정 안되도록
        guard let text = textField.text else {return true}
        if text.count > 4 {
            return false
        }
        return true
    }
    
    //엔터키가 눌러지면 다음 동작을 하게할건지 여부
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "Type Something"
            return false
        }
        return true
    }
    
    //입력이 끝나게할지말지 여부
    //ex.첫번째 칸 validate 통과해야만 다른거 쓸수 있게 할 때?
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        guard let text = textField.text else {return true}
//        if text.count > 4 {
//            return true
//        }
//        return false
        return true
    }

    //입력이 끝난 시점에 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    */
    
    
    //🍑 글자 개수 제한
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

       
        print("textField.text => ", textField.text!.count)
        print((textField.text! + string).count)
        print("replacementString => ", string)
        
        //내가 처음 생각했었던 코드
        //=> 안되는 이유 : textField.text는 이전에 입력했던값까지 나오고 string이 지금 입력한 값이 나오기 때문에
        //=> textField.text + string 해야 지금까지 입력한 문자열이 나온다
//        guard let text = textField.text else {return true}
//        if textField.text!.count > 10 {
//            return false
//        }
//        return true
        
        //수정한 코드
//        if (textField.text! + string).count > 10 {
//            return false
//        }
//        return true
        
        //더 간단히
        return (textField.text! + string).count <= 10
        
        //블로그 참고한 코드
//        return self.textLimit(existingText: textField.text, newText: string, limit: 10)

        
        
        
    }
     
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
//    private func textLimit(existingText: String?,newText: String,limit: Int) -> Bool {
//        let text = existingText ?? ""
//        let isAtLimit = text.count + newText.count <= limit
//        return isAtLimit
//    }


}

