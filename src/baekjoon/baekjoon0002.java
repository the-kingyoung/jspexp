package baekjoon;

import java.util.Scanner;

public class baekjoon0002 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		int A = scan.nextInt();
		
		scan.close();
		
		if(A>=90||A<=100) System.out.println("A등급");
		else if(A>=80||A<90) System.out.println("B등급");
		else if(A>=70||A<80) System.out.println("C등급");
		else if(A>=60||A<70) System.out.println("D등급");
		else System.out.println("F등급");
	}

}
