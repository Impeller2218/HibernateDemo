package ex102aug;

public class pattern {

	public static void main(String[] args) {
		int c=1;
		int p=2;
		// TODO Auto-generated method stub
		for(int i=1;i<=5;i++) {
			c=i;
			for (int j=i;j<=5;j++) {
				System.out.print(c + "\t");
				c=c*p;
				
			}
//			c=c+1;
			p=p+1;
			System.out.println();
		}
	}

}
