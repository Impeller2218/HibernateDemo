package ex102aug;

public class series {

	public static void main(String[] args) {
		int n =10;
		double sum=0;
		double i=1;
		double j=2;
		while(i<=n && j<=n ) {
			double fact = 1;
			double x=j;
	        while(x > 0)
	        {
	            fact = fact * x;
	            x--;
	        }
	        
			sum = sum+(i/fact);
			i=i+2;
			j=j+2;
		}
		
		System.out.println("Sum of the series 1/2!+3/4!+5/6! upto 10 is " +sum);
		
	
}
}