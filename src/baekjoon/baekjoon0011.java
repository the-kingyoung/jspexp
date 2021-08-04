package baekjoon;

import java.util.Arrays;
import java.util.Scanner;

public class baekjoon0011 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		
		double arr[] = new double[scan.nextInt()];
		
		for(int i = 0; i < arr.length; i++) {
			arr[i] = scan.nextDouble();
		}
		scan.close();
		
		double sum = 0;
		Arrays.sort(arr);
		
		for(int i = 0; i <arr.length; i++) {
			sum+=((arr[i]/arr[arr.length-1])*100);
		}
		System.out.println(sum/arr.length);
		
	}

}
