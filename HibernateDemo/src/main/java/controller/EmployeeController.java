package controller;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import model.BankAccount;
import model.Department;
import model.Employee;
import model.Employee.EmployeeFactory;
import service.EmployeeService;
@RequestMapping("/employee")
@Controller
public class EmployeeController {
	

	@Autowired
	EmployeeService service;
	@RequestMapping("/")
	public String home(Model model){
		System.out.println("In home");
/*		Employee emp=new Employee();
		emp.setEmpName("Krishna Sai");
		emp.setEmpPhoneNum("772984");
		emp.setExperience("4");
		//emp.setGender("M");
		SimpleDateFormat sdf=new SimpleDateFormat("dd/mm/yyyy");
		try {
			Date dob=sdf.parse("14/06/1999");
			emp.setDob(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		service.addEmployeeDetails(emp);
		*/
		//model.addAttribute("employee",EmployeeFactory.create());
		//Long count=service.getEmpCount();
		//System.out.println(count);
		//model.addAttribute("empCount",count);
		return "index";
	}
	@RequestMapping("/page")
	public String page(Model model){
		Long count=service.getEmpCount();
		System.out.println(count);
		model.addAttribute("empCount",count);
		return "page";
		
	}
	
	@RequestMapping("/goIndex")
	public String goIndex(){
		return "index";
	}
	@RequestMapping("/index")
	public String addemp(){
		return "add";
	}
	@RequestMapping("/tryAgain")
	public String tryAgain(){
		return "add";
	}
	
	@ModelAttribute
	public void commonStuff(Model model){
		model.addAttribute("HeaderStatus","Enter Employee details");
		model.addAttribute("emp",EmployeeFactory.create());
	}

	@RequestMapping("/add")
	public String addEmployee(@ModelAttribute("emp") Employee emp){
		System.out.println("Adding employee (in controller)");
		 boolean flag = false;
		 //--
		 /*
		 Department dept=new Department();
		 BankAccount account=new BankAccount();
		 dept.setDeptId(2);
		 dept.setDeptName("cse");
		 dept.setHodName("Raju");
		 account.setAccountType("Savings");
		 account.setBankName("Hdfc");
		 account.setIfsc("Hdfc1122");
		 emp.setDepartment(dept);
		 emp.setBankAccount(account);
		 */
		 //--
		 flag=service.addEmployeeDetails(emp);
		 if(flag)
			 return "success";
		 return "error";
		
	}
	@RequestMapping("addDept/{empId}/{deptId}")
	public String addEmployeeNew(@PathVariable int empId,@PathVariable int deptId,Model model){
		System.out.println("Adding employee new (in controller)");
		 int flag =0;
		 Department dept=new Department();
		 Employee emp=new Employee();
		 emp.setEmpId(empId);
		 dept.setDeptId(deptId);
		 emp.setDepartment(dept);
		 flag=service.updateEmployeeNew(emp);
		 if(flag>=1){
			 model.addAttribute("emp",emp);
			 return "updateDeptSuccess";
		 }
		 return "error";	
	}
	//---------Delete---------
/*	@RequestMapping("/delete/{empId}")
	public String delete(@PathVariable int empId,Model model){
		
		
	}*/
	//-----------------To Fetch Details--------------------
	@RequestMapping("/fetch")
	public String getEmployees(int empId,HttpServletRequest request,HttpServletResponse response){
		System.out.println("Fetching in controller");
		 boolean flag = false;
		 List<Employee> list;
		 list=service.getEmployeeDetails(empId);
		 if(!list.isEmpty())
			 flag=true;
		 if(flag){
		 request.setAttribute("empList",list);
		 return "home";
		 }
		 else
			 return "error";
		
	}
	@RequestMapping("/showAllEmployees")
	public String getAllEmployees(HttpServletRequest request,HttpServletResponse response){
		boolean flag = false;
		List<Employee> list;
		list=service.getAllEmployees();
		 if(!list.isEmpty())
			 flag=true;
		 if(flag){
		 request.setAttribute("fullEmpList",list);
		 return "showEmployees";
		 }
		 else
			 return "error";
	}
	@RequestMapping("/employeeListHbq")
	public String employeeList(HttpServletRequest request,HttpServletResponse response){
		boolean flag = false;
		List<Employee> list;
		list=service.employeeList();
		 if(!list.isEmpty())
			 flag=true;
		 if(flag){
		 request.setAttribute("empListHbq",list);
		 return "showEmployeesHbq";
		 }
		 else
			 return "error";
	}
	@RequestMapping("/distinctEmployees")
	public String distinctEmployees(HttpServletRequest request,HttpServletResponse response){
		boolean flag=false;
		List<Integer> list=new ArrayList<Integer>();
		list=service.distinctEmployees();
		 if(!list.isEmpty())
			 flag=true;
		 if(flag){
		 request.setAttribute("distinctEmpList",list);
		 return "distinctEmployees";
		 }
		 else
			 return "error";
	}
	
		
	@RequestMapping("/update/{eName}/{ePhoneNum}/{eId}")
	public String update(@PathVariable String eName,@PathVariable String ePhoneNum,@PathVariable int eId,Model model){
		int flag=0;
		Employee emp=new Employee();
		emp.setEmpName(eName);
		emp.setEmpPhoneNum(ePhoneNum);
		emp.setEmpId(eId);
		flag=service.update(emp);
		if(flag>=1){
		model.addAttribute("empAttribute",emp);
		return "update";
		}
		else
			return "error";
	}
	//@RequestMapping("/create/{eName}/{ePhoneNum}/{experience}/{}")
	@RequestMapping("/create/{count}")
	public String createEmpBulk(@PathVariable int count){
		Date dob=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("dd/mm/yyyy");
		try {
			 dob=sdf.parse("10/10/1995");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		for(int i=1;i<=count;i++){
			Employee e=new Employee();
			e.setEmpName("employee"+i);
			e.setEmpPhoneNum("7744"+i);
			if(i%2==0)
			e.setExperience("2");
			else
				e.setExperience("3");
			e.setSalary(28000+i*1000);
			e.setDob(dob);
			service.addEmployeeDetails(e);
			
		}
		return "index";
	}
	//------------pagination
	@RequestMapping("/getPage/{pageNum}")
	public String pagination(@PathVariable String pageNum,Model model){
		int pageNo=Integer.parseInt(pageNum);
		int noRecords=10;
		int rowFrom=1;
		rowFrom=((pageNo-1)*noRecords)+1;
		List<Employee> list=service.getEmployeePagination(rowFrom, noRecords);
		model.addAttribute("pageList",list);
		return "page";
	}
	//----------------Update dept
	@RequestMapping("/updateDept/{empId}/{deptId}")
	public String pagination(@PathVariable int empId,@PathVariable int deptId,Model model){
		int flag=0;
		Employee emp=new Employee();
		emp.setEmpId(empId);
		Department dept=new Department();
		dept.setDeptId(deptId);
		emp.setDepartment(dept);
		flag=service.updateDepartment(emp);
		if(flag>=1){
			model.addAttribute("emp",emp);
			return "deptUpdateSuccess";
		}
		else
			return "error";
	}
	//-------Update account
	@RequestMapping("addAccount/{empId}/{accountId}")
	public String addAccountNew(@PathVariable int empId,@PathVariable int accountId,Model model){
		System.out.println("Adding account new (in controller)");
		 int flag =0;
		 BankAccount account=new BankAccount();
		 Employee emp=new Employee();
		 emp.setEmpId(empId);
		 System.out.println(empId);
		 account.setAccountId(accountId);
		 emp.setBankAccount(account);
		 flag=service.addAccountNew(emp);
		 if(flag>=1){
			 model.addAttribute("emp",emp);
			 return "updateSuccess";
		 }
		 return "error";	
	}
	@RequestMapping("projectAssign")
	public void assignEmployeeProjects(){
		service.assignEmployeeProjects();
	}
}
