package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import data.ProjectDao;
import model.BankAccount;
import model.Department;
import model.Employee;
import model.Project;

@RequestMapping("/project")
@Controller
public class ProjectController {
	@Autowired
	ProjectDao projectDao;
	@RequestMapping("/add/{projectName}/{projectLead}")
	public String addProject(@PathVariable String projectName,@PathVariable String projectLead,Model model){
		boolean flag=false;
		Project project=new Project();
		project.setProjectName(projectName);
		project.setProjectLead(projectLead);
		flag=projectDao.addProject(project);
		if(flag){
			model.addAttribute("project",project);
			return "projectSuccess";
		}
		else
			return "error";
	}
	@RequestMapping("/updateLead/{projectId}/{leadId}")
	public String updateHod(@PathVariable int projectId,@PathVariable int leadId,Model model){
		int flag=0;
		Project project=new Project();
		Employee emp=new Employee();
		emp.setEmpId(leadId);
		project.setProjectID(projectId);
		project.setLeadEmployee(emp);
		flag=projectDao.updateLead(project);
		if(flag>=1){
			model.addAttribute("project",project);
			return "updateProjectLeadSuccess";
		}
		else
			return "error";
	}
	
	@RequestMapping("/showAll")
	public String getAllBankAccounts(Model model){
		boolean flag = false;
		List<Project> list;
		list=projectDao.getAllProjects();
		if(!list.isEmpty())
			 flag=true;
		 if(flag){
		 model.addAttribute("projectList",list);
		 return "showAllProjects";
		 }
		 else
			 return "error";
	}
}
