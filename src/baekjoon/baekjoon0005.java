package baekjoon;

import java.util.Scanner;

public class baekjoon0005 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		
		int c = scan.nextInt();
		int arr[] = new int[c];
		
		for(int i = 0; i < c; i++) {
			int a = scan.nextInt();
			int b = scan.nextInt();
			
			arr[i] = a+b;

		}
		scan.close();
		
		for(int j : arr) {
			System.out.print(j+", ");
		}
	}

}
