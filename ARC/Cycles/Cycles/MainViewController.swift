/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class MainViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    runScenario()
  }
  
  func runScenario() {
    let user = User(name: "Prashuk")
    let iphone = Phone(model: "iPhone X")
    user.add(phone: iphone)
    /*
     Here, you add iPhone to user. add(phone:) also sets the owner property of iPhone to user.

     Now build and run, and you’ll see user and iPhone do not deallocate. A strong reference cycle between the two objects prevents ARC from deallocating either of them.
     
     https://koenig-media.raywenderlich.com/uploads/2016/05/UserIphoneCycle.png
     */
  }
}

class User {
  let name: String
  private(set) var phones: [Phone] = []
  
  init(name: String) {
    self.name = name
    print("User \(name) was initialized")
  }
  
  deinit {
    print("Deallocation user named: \(name)")
  }
  
  func add(phone: Phone) {
    phones.append(phone)
    phone.owner = self
  }
  /*
   This adds a phones array property to hold all phones owned by a user. The setter is private, so clients have to use add(phone:). This method ensures that owner is set properly when you add it.
   */
}

class Phone {
  let model: String
  weak var owner: User?
  /*
   Build and run again. Now user and phone deallocate properly once the runScenario() method exits scope.
   */
  
  init(model: String) {
    self.model = model
    print("Phone \(model) was initialized")
  }
  
  deinit {
    print("Deallocating phone named: \(model)")
  }
}
