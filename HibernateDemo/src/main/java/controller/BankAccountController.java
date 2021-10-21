package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import data.BankAccountDao;
import model.BankAccount;

@RequestMapping("/bankAccount")
@Controller
public class BankAccountController {
	@Autowired
	BankAccountDao bankAccountDao;
	@RequestMapping("/add/{accountType}/{bankName}/{ifsc}")
	public String addBankAccount(@PathVariable String accountType,@PathVariable String bankName,@PathVariable String ifsc,Model model ){
		BankAccount account=new BankAccount();
		account.setAccountType(accountType);
		account.setBankName(bankName);
		account.setIfsc(ifsc);
		boolean flag=false;
		flag=bankAccountDao.addBankAccount(account);
		if(flag){
			model.addAttribute("account",account);
			return "bankSuccess";
		}
		else
			return"error";
	}
	//-------all accounts
	@RequestMapping("/showAll")
	public String getAllBankAccounts(Model model){
		boolean flag = false;
		List<BankAccount> list;
		list=bankAccountDao.getAllBankAccounts();
		if(!list.isEmpty())
			 flag=true;
		 if(flag){
		 model.addAttribute("accountList",list);
		 return "showAllAccounts";
		 }
		 else
			 return "error";
	}
}
