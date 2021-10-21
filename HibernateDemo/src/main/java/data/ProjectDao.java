package data;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import model.Project;

@Repository("projectDao")
public class ProjectDao {
	@Autowired
	SessionFactory sessionFactory;
	Transaction tx=null;
	public boolean addProject(Project project){
		System.out.println("Adding project (in projectDao)");
		Session session=null;
		try{
			session=sessionFactory.openSession();
			tx=session.beginTransaction();
			session.save(project);
			tx.commit();
			System.out.println("Project Commit");
			return true;
			}catch(Exception e){
				System.out.println("Project Rollback");
				tx.rollback();
				return false;
			}
			finally{
				if(session!=null)
					session.close();
			}
	}
	
	
	public int updateLead(Project project){
		Session session=sessionFactory.getCurrentSession();
		if(!session.getTransaction().isActive())
			session.beginTransaction();
		Query<Project> query=session.createQuery("update Project set leadId=:l where projectId=:p");
		query.setParameter("l",project.getLeadEmployee());
		query.setParameter("p", project.getProjectID());
		System.out.println(project.getProjectID());
		int status=0;
		status=query.executeUpdate();
		session.getTransaction().commit();
		return status;
	}
	
	public List<Project> getAllProjects(){
		Session session=sessionFactory.getCurrentSession();
		if(!session.getTransaction().isActive())
			session.beginTransaction();
		Query<Project> query=session.createQuery("from Project",Project.class);
		return query.list();
	}

}
