package util;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import model.BankAccount;
import model.Department;
import model.Employee;
import model.Project;

public class HibernateUtil {
	private static StandardServiceRegistry registry;
	private static SessionFactory sessionFactory;
	
	public static Map<String,String> getSessionFactoryMap(){
		Map<String,String> map=new HashMap();
		map.put("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
		map.put("hibernate.connection.url","jdbc:mysql://localhost:3306/test321");
		map.put("hibernate.connection.username","root");
		map.put("hibernate.connection.password","Sai101010@#7089");
		map.put("hibernate.dialect","org.hibernate.dialect.MySQL8Dialect");
		map.put("hibernate.show_sql","true");
		map.put("hibernate.format_sql","true");
		map.put("hibernate.hbm2ddl.auto","update");
		map.put("hibernate.current_session_context_class","thread");
		return map;
	}
	public static SessionFactory getSessionFactory(){
		if(sessionFactory==null){
			System.out.println("in getSessionFactory");
			//Configuration config=new Configuration();
			//config.addResource("employee.hbm.xml");  //To directly access hbm.xml file
			//config.configure();
			System.out.println("at Config");
			//method1
			//StandardServiceRegistryBuilder registryBuilder=new StandardServiceRegistryBuilder();//1
			/*registry=registryBuilder.applySettings(config.getProperties()).build();
			System.out.println("at Registry");
			sessionFactory=config.buildSessionFactory(registry);
			System.out.println("at metadata sessionfactory");
			//------------
			//registry=new StandardServiceRegistryBuilder().configure().build();
			//MetadataSources sources=new MetadataSources();
			//Metadata metadata = sources.getMetadataBuilder().build();
			//System.out.println("at Metadata");
			//sessionFactory=metadata.getSessionFactoryBuilder().build();
			//--------------
			*/
			//++++++++++++For latest versions
			/*registry=registryBuilder.configure("hibernate.cfg.xml").build();//1
			Metadata metadata=new MetadataSources(registry).getMetadataBuilder().build();//1
			sessionFactory=metadata.getSessionFactoryBuilder().build();//1
*/			
			//---------eliminating hibernate cfg xml-----------------
			Map<String,String> map=getSessionFactoryMap();
			StandardServiceRegistry registry=new StandardServiceRegistryBuilder().applySettings(map).build();
			MetadataSources sources=new MetadataSources(registry);
			//sources.addResource("employee.hbm.xml");
			sources.addAnnotatedClass(Employee.class);
			sources.addAnnotatedClass(Department.class);
			sources.addAnnotatedClass(BankAccount.class);
			sources.addAnnotatedClass(Project.class);
			Metadata metadata=sources.getMetadataBuilder().build();
			sessionFactory=metadata.getSessionFactoryBuilder().build();
			
		}
		return sessionFactory;
	}
	
	public static void shutdown(){
		if(registry!=null){
			StandardServiceRegistryBuilder.destroy(registry);
			System.out.println("at null registry");
		}
	}

}
