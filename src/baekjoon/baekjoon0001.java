package baekjoon;

import java.util.Scanner;

public class baekjoon0001 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		int A = scan.nextInt();
		int B = scan.nextInt();
		
		scan.close();
		
		if(A>B) System.out.println(A+">"+B);
		else if(A<B) System.out.println(A+"<"+B);
		else System.out.println(A+"=="+B);
	}

}
