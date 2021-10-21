package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Department;
import model.Employee;
import service.DepartmentService;


@RequestMapping("/department")
@Controller
public class DepartmentController {
	@Autowired
	DepartmentService deptService;
	@RequestMapping("/add/{deptName}/{hodName}")
	public String addDepartment(@PathVariable String deptName,@PathVariable String hodName,Model model){
		boolean flag=false;
		Department dept=new Department();
		dept.setDeptName(deptName);
		dept.setHodName(hodName);
		flag=deptService.addDepartment(dept);
		if(flag){
			model.addAttribute("dept",dept);
			return "deptSuccess";
		}
		else
			return "error";
	}
	
	@RequestMapping("/show")
	public String getAllDepartments(Model model){
		boolean flag=false;
		List<Department> list;
		list=deptService.getAllDepartments();
		if(!list.isEmpty())
			 flag=true;
		 if(flag){
			 model.addAttribute("deptList",list);
			 return "showAllDept";
		 }
		 else 
			 return "error";
		
	}
	
	@RequestMapping("/updateHod/{deptId}/{hodId}")
	public String updateHod(@PathVariable int deptId,@PathVariable int hodId,Model model){
		int flag=0;
		Department dept=new Department();
		dept.setDeptId(deptId);
		Employee emp=new Employee();
		emp.setEmpId(hodId);
		dept.setHodEmployee(emp);
		flag=deptService.updateHod(dept);
		if(flag>=1){
			model.addAttribute("dept",dept);
			return "updateHodSuccess";
		}
		else
			return "error";
	}
	

}
