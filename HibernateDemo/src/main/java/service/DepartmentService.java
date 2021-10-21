package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import data.DepartmentDao;
import model.Department;

@Service("departmentService")
public class DepartmentService {
	@Autowired
	@Qualifier("departmentDao")
	DepartmentDao deptDao;
	public boolean addDepartment(Department dept){
		boolean flag=false;
		flag=deptDao.addDepartment(dept);
		return flag;
	}
	
	public List<Department> getAllDepartments(){
		List<Department> list;
		list=deptDao.getAllDepartments();
		return list;
	}
	
	public int updateHod(Department dept){
		return deptDao.updateHod(dept);
	}

}
