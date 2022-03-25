//
//  ViewController.swift
//  Login
//
//  Created by Beytullah Özer on 24.03.2022..
//

import UIKit
import Firebase

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // UI Elements
    
    var noInvoiceView = UIView()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        setDefaultSize(view: view)
        createUI()
        
    }
        
    
    func createUI(){
        
       
        view.backgroundColor = .white
      
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.text = "Home"
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = font_SFProBold(size: 30)
        titleLabel.frame = CGRect(x: 0.1 * screenWidth, y: 0.06 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        view.addSubview(titleLabel)
        
        let btnInvoices = UIButton()
        btnInvoices.frame = CGRect(x: 0.06 * screenWidth, y: 0.03 * screenWidth, width: 0.12 * screenWidth, height: 0.12 * screenWidth)
        btnInvoices.setBackgroundImage(UIImage(named: "btn_invoices"), for: .normal)
        btnInvoices.addTarget(self, action: #selector(btnInvoicesClicked), for: UIControl.Event.touchUpInside)
        btnInvoices.center.y = titleLabel.center.y
        view.addSubview(btnInvoices)
        
        let btnProfile = UIButton()
        btnProfile.frame = CGRect(x: 0.86 * screenWidth, y: 0.03 * screenWidth, width: 0.07 * screenWidth, height: 0.07 * screenWidth)
        btnProfile.setBackgroundImage(UIImage(named: "btn_profile"), for: .normal)
        btnProfile.addTarget(self, action: #selector(btnProfileClicked), for: UIControl.Event.touchUpInside)
        btnProfile.center.y = titleLabel.center.y
        view.addSubview(btnProfile)

        
        createTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadItems(notification:)), name: Notification.Name("ReloadInvoices"), object: nil)
        createTabbar()
        
    }
    
    @objc func reloadItems(notification: Notification) {
        
        tableView.reloadData()
    }
    
    
    func createTableView(){
        
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(InvoiceCell.self, forCellReuseIdentifier: "InvoiceCell")
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        tableView.frame = CGRect(x: 0, y: 0.15 * screenHeight, width: screenWidth, height: 0.75 * screenHeight)
        tableView.separatorColor = .clear
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allInvoices.count
    }

  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvoiceCell", for: indexPath) as! InvoiceCell
        cell.isUserInteractionEnabled = true
        
      
        cell.lblName.textColor = .black
        cell.lblName.text = allInvoices[indexPath.row].client.name
        cell.lblName.numberOfLines = 2
        cell.lblName.textAlignment = .left
        cell.lblName.font = font_SFProBold(size: 24)
        cell.lblName.frame = CGRect(x: 0.05 * screenWidth, y: 10, width: 0.8 * screenWidth, height: 30)
        
        cell.lblInvoiceNumber.textColor = .black
        cell.lblInvoiceNumber.text = "Invoice \(allInvoices[indexPath.row].invoiceNumber)"
        cell.lblInvoiceNumber.numberOfLines = 2
        cell.lblInvoiceNumber.textAlignment = .left
        cell.lblInvoiceNumber.font = font_SFProRegular(size: 16)
        cell.lblInvoiceNumber.frame = CGRect(x: 0.05 * screenWidth, y: 50, width: 0.8 * screenWidth, height: 20)
        
        cell.lblTotal.textColor = .black
        cell.lblTotal.text = "$\(allInvoices[indexPath.row].total)"
        cell.lblTotal.numberOfLines = 2
        cell.lblTotal.textAlignment = .left
        cell.lblTotal.font = font_SFProRegular(size: 16)
        cell.lblTotal.frame = CGRect(x: 0.05 * screenWidth, y: 80, width: 0.8 * screenWidth, height: 20)
        
        cell.lblDueDate.textColor = .black
        cell.lblDueDate.text = "Due Date: \(allInvoices[indexPath.row].dueDate)"
        cell.lblDueDate.numberOfLines = 2
        cell.lblDueDate.textAlignment = .left
        cell.lblDueDate.font = font_SFProRegular(size: 16)
        cell.lblDueDate.frame = CGRect(x: 0.05 * screenWidth, y: 110, width: 0.8 * screenWidth, height: 20)
        
      
        cell.btnResend.setTitle(NSLocalizedString("RESEND", comment: ""), for: UIControl.State.normal)
        cell.btnResend.setTitleColor(UIColor.white, for: UIControl.State.normal)
        cell.btnResend.frame = CGRect(x: 0.05 * screenWidth, y:  150, width: 0.35 * screenWidth, height: 35)
        cell.btnResend.contentVerticalAlignment.self = .center
        cell.btnResend.contentHorizontalAlignment.self = .center
        cell.btnResend.backgroundColor = clr_blue
        cell.btnResend.titleLabel?.font = font_SFProRegular(size: 16)
        cell.btnResend.addTarget(self, action: #selector(btnResendClicked), for: UIControl.Event.touchUpInside)
        cell.btnResend.addCornerRadious()
        
        cell.btnPaid.setTitle(NSLocalizedString("PAID", comment: ""), for: UIControl.State.normal)
        cell.btnPaid.setTitleColor(UIColor.black, for: UIControl.State.normal)
        cell.btnPaid.frame = CGRect(x: 0.05 * screenWidth, y:  150, width: 0.35 * screenWidth, height: 35)
        cell.btnPaid.contentVerticalAlignment.self = .center
        cell.btnPaid.contentHorizontalAlignment.self = .center
        cell.btnPaid.backgroundColor = .clear
        cell.btnPaid.titleLabel?.font = font_SFProRegular(size: 16)
        cell.btnPaid.tag = indexPath.row
        cell.btnPaid.addCornerRadious()
        cell.btnPaid.layer.borderColor = UIColor(red: 0.24, green: 0.78, blue: 0.05, alpha: 1.00).cgColor
        cell.btnPaid.layer.borderWidth = 2
        cell.btnPaid.setImage(UIImage(named: "btn_check"), for: .normal)
        
        
        cell.btnMarkAsPaid.setTitle(NSLocalizedString("MARK AS PAID", comment: ""), for: UIControl.State.normal)
        cell.btnMarkAsPaid.setTitleColor(UIColor.black, for: UIControl.State.normal)
        cell.btnMarkAsPaid.frame = CGRect(x: 0.45 * screenWidth, y:  150, width: 0.5 * screenWidth, height: 35)
        cell.btnMarkAsPaid.contentVerticalAlignment.self = .center
        cell.btnMarkAsPaid.contentHorizontalAlignment.self = .center
        cell.btnMarkAsPaid.backgroundColor = .clear
        cell.btnMarkAsPaid.layer.borderColor = clr_blue.cgColor
        cell.btnMarkAsPaid.tag = indexPath.row
        cell.btnMarkAsPaid.addTarget(self, action: #selector(btnMarkAsPaidClicked), for: UIControl.Event.touchUpInside)
        cell.btnMarkAsPaid.layer.borderWidth = 2
        cell.btnMarkAsPaid.titleLabel?.font = font_SFProRegular(size: 16)
        cell.btnMarkAsPaid.isUserInteractionEnabled = true
        cell.btnMarkAsPaid.addCornerRadious()
      
        if allInvoices[indexPath.row].invoiceStatus == .paid{
            
            cell.btnMarkAsPaid.isHidden = true
            cell.btnResend.isHidden = true
            cell.btnPaid.isHidden = false
            
        }else{
            
            cell.btnMarkAsPaid.isHidden = false
            cell.btnResend.isHidden = false
            cell.btnPaid.isHidden = true
            
        }
        
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
   
        let destinationVC = PageVC()
//        destinationVC.isNewInvoice = false
        selectedInvoice = allInvoices[indexPath.row]
        presentAsPageSheet(currentVC: self, destinationVC: destinationVC)
        
    
    }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 200
  }
  
 

  

    
    func createNoInvoiceView() -> UIView{
        
        
        let noInvoiceView = UIView()
        
        let imgNoInvoice = UIImageView()
        imgNoInvoice.image = UIImage(named: "img_noInvoice")
        imgNoInvoice.frame = CGRect(x: 0.3 * screenWidth, y: 0.05 * screenHeight, width: 0.4 * screenWidth, height: 0.4  * screenWidth)
        noInvoiceView.addSubview(imgNoInvoice)
        lastObjectFrane = imgNoInvoice.frame
    
    
        let titleNoInvoice = UILabel()
        titleNoInvoice.textColor = .black
        titleNoInvoice.text = "Create Invoices &\nGet Paid"
        titleNoInvoice.numberOfLines = 2
        titleNoInvoice.textAlignment = .center
        titleNoInvoice.font = font_SFProBold(size: 24)
        titleNoInvoice.frame = CGRect(x: 0.1 * screenWidth, y: lastObjectFrane.maxY + 0 * screenHeight, width: 0.8 * screenWidth, height: 0.10 * screenHeight)
        noInvoiceView.addSubview(titleNoInvoice)
        lastObjectFrane = titleNoInvoice.frame
        
        let subtitleNoInvoice = UILabel()
        subtitleNoInvoice.textColor = .black
        subtitleNoInvoice.text = "Add your invoices here, and send\nthem to your clients!"
        subtitleNoInvoice.numberOfLines = 2
        subtitleNoInvoice.textAlignment = .center
        subtitleNoInvoice.font = font_SFProRegular(size: 16)
        subtitleNoInvoice.frame = CGRect(x: 0.1 * screenWidth, y: lastObjectFrane.maxY + 0 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        noInvoiceView.addSubview(subtitleNoInvoice)
        lastObjectFrane = subtitleNoInvoice.frame
        
        return noInvoiceView
    }
    
    
    @objc func createInvoiceClicked(){
        
//        presentVC(currentVC: self, destinationVC: CreateInvoiceVC(), toDirection: .down)
    }
    
    @objc func btnResendClicked(sender : UIButton){
        
        
        
    }
    
    @objc func btnMarkAsPaidClicked(sender : UIButton){
        
        allInvoices[sender.tag].invoiceStatus = .paid
        let db = Firestore.firestore()
        db.collection("Users").document((Auth.auth().currentUser?.email)!).collection("Clients").document("\(allInvoices[sender.tag].client.clientID)").collection("Invoices").document("\(allInvoices[sender.tag].invoiceID)").updateData([
            "invoiceStatus" : "\(InvoiceStatus.paid)",
            
        ])
        
        tableView.reloadData()
    }
    
  
    func createTabbar(){
        
        
        let tabbarView = UIView()
        tabbarView.frame = CGRect(x: 0, y: screenHeight -  0.23 * screenWidth, width: screenWidth, height: 0.23 * screenWidth)
        view.addSubview(tabbarView)
        
        let tabbarImageView = UIImageView()
        tabbarImageView.image = UIImage(named: "img_tabbar_bg")
        tabbarImageView.frame = CGRect(x: 0, y: -0.09 * screenWidth, width: screenWidth, height: 0.38 * screenWidth)
        tabbarImageView.layer.shadowColor = UIColor.black.cgColor
        tabbarImageView.layer.shadowOpacity = 0.08
        tabbarImageView.backgroundColor = .white
        tabbarImageView.layer.shadowOffset = .zero
        tabbarImageView.layer.shadowRadius = 20
        tabbarImageView.backgroundColor = .clear
        tabbarView.addSubview(tabbarImageView)
        
        
        let btnSend = UIButton()
        btnSend.frame = CGRect(x: 0.4 * screenWidth, y: screenHeight -  0.23 * screenWidth - 0.07 * screenWidth, width: 0.2 * screenWidth, height: 0.2 * screenWidth)
        btnSend.setBackgroundImage(UIImage(named: "btn_create"), for: .normal)
        btnSend.addTarget(self, action: #selector(btnSendClicked), for: UIControl.Event.touchUpInside)
        view.addSubview(btnSend)
        
        let btnHome = UIButton()
        btnHome.frame = CGRect(x: 0.17 * screenWidth, y: 0.03 * screenWidth, width: 0.06 * screenWidth, height: 0.06 * screenWidth)
        btnHome.setBackgroundImage(UIImage(named: "btn_home_selected"), for: .normal)
        btnHome.addTarget(self, action: #selector(btnHomeClicked), for: UIControl.Event.touchUpInside)
        tabbarView.addSubview(btnHome)
        lastObjectFrane = btnHome.frame
        
        let lblHome = UILabel()
        lblHome.textColor =  clr_blue
        lblHome.text = "Home"
        lblHome.textAlignment = .center
        lblHome.font = font_SFProSemiBold(size: 11)
        lblHome.frame = CGRect(x: 0.15 * screenWidth, y: lastObjectFrane.maxY + 0.005 * screenHeight, width: 0.1 * screenWidth, height: 0.04 * screenWidth)
        lblHome.onClick { [self] in btnHomeClicked()}
        tabbarView.addSubview(lblHome)
        
        let btnClients = UIButton()
        btnClients.frame = CGRect(x: 0.76 * screenWidth, y: 0.03 * screenWidth, width: 0.08 * screenWidth, height: 0.06 * screenWidth)
        btnClients.setBackgroundImage(UIImage(named: "btn_client_unselected"), for: .normal)
        btnClients.addTarget(self, action: #selector(btnClientsClicked), for: UIControl.Event.touchUpInside)
        tabbarView.addSubview(btnClients)
        lastObjectFrane = btnClients.frame
        
        let lblClients = UILabel()
        lblClients.textColor = clr_unselectedTabbarTitle
        lblClients.text = "Clients"
        lblClients.textAlignment = .center
        lblClients.font = font_SFProSemiBold(size: 11)
        lblClients.frame = CGRect(x: 0.75 * screenWidth, y: lastObjectFrane.maxY + 0.005 * screenHeight, width: 0.1 * screenWidth, height: 0.04 * screenWidth)
        lblClients.onClick { [self] in btnClientsClicked()}
        tabbarView.addSubview(lblClients)
        
        
        
        
        
    }
    
    @objc func btnHomeClicked(){

      //  presentVCWithoutAnimation(currentVC: self, destinationVC: HomeVC())
    }
    
    @objc func btnSendClicked(){

//        selectedClient = Client()
//        selectedInvoice = Invoice()
//        presentVC(currentVC: self, destinationVC: SendInvoiceVC(), toDirection: .down)
    }
    
    @objc func btnClientsClicked(){

//        presentVCWithoutAnimation(currentVC: self, destinationVC: ClientsVC())
    }
    
    @objc func btnInvoicesClicked(){

//        presentVC(currentVC: self, destinationVC: InvoicesVC(), toDirection: .left)
    }
    
    @objc func btnProfileClicked(){

//        presentVC(currentVC: self, destinationVC: ProfileVC(), toDirection: .right)
    }
    


}
