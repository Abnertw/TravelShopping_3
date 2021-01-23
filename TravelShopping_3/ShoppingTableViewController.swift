//
//  ShoppingTableViewController.swift
//  TravelShopping_3
//
//  Created by Abnertw on 2021/1/22.

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    // UIStepper，將所有Stepper用outlet collection連結
    // UILabel，將所有Label(總金額以外)用outlet collection連結
    // totalPriceLabel單獨一個用outlet做連結
    @IBOutlet var countStepper: [UIStepper]!
    @IBOutlet var numberLabel: [UILabel]!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    // 將所有價格以陣列的方式，存於變數中
    var prices = [450, 550, 490, 580, 660]
    
    /* 清除鍵(建立1個func)
       使用for迴圈將所有numberLabel存入自訂名稱label中，
       並且將所有numberLabel中的值變為0(所有的值跑過1次)
       總金額的label的值亦變為0
       一樣，把所有的countStepper中的值變為0(所有的值跑過1次)
     */
    func clearButton() {
        for label in numberLabel {
            label.text = "0"
        }
        totalPriceLabel.text = "0"
        for stepper in countStepper {
            stepper.value = 0
        }
    }
    
    /* 計算總金額(建立1個func)
       先宣告總金額為0
       將陣列中所有的成員帶入count這個變數中
       並用迴圈去執行sum(也就是sum是0 + (張數*價格))
       最後顯示上列計算後的總金額
     */
    func calculator() {
        var sum = 0
        for (count,price) in prices.enumerated() {
            sum += Int(countStepper[count].value) * price
        }
        totalPriceLabel.text = "\(sum)"
    }
    
    
    /* UIStepper
       先將計步器的值，從Float轉型成Int，並存入常數中
       再將常數轉成字串，並帶入張數計步器標籤的numberLabel中
     */
    @IBAction func stepperChanged(_ sender: UIStepper) {
        let number = Int(sender.value)
        numberLabel[sender.tag].text = "\(number)"
        calculator()
    }
    
    
    /* 清除鍵
       將上方已寫好的清除鍵指令(func)名稱帶入即可
     */
    @IBAction func clearBT(_ sender: Any) {
        clearButton()
    }
    
    
    // 程式最開始時。將所有初始值皆歸0
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton()
    }

    
    
    // MARK: - Table view data source
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
