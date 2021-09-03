package baekjoon;

import java.util.Scanner;

public class baekjoon0024 {
	
	static Integer[] kk;
	
	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

		int N = scan.nextInt();
		
		kk = new Integer[N+1];
		kk[0] = kk[1] = 0;
		
		System.out.println(accu(N));

	}
	
	static int accu(int N) {
		if(kk[N] == null) {
			if(N%6 == 0) {
				kk[N] = Math.min(accu(N-1), Math.min(accu(N/3), accu(N/2)))+1;
			}
			
			else if(N%3 == 0) {
				kk[N] = Math.min(accu(N/3), accu(N-1)) +1;
			}
			else if(N%2 == 0) {
				kk[N] = Math.min(accu(N/2), accu(N-1))+1;
			}
			else {
				kk[N] = accu(N-1)+1;
			}
		}
		return kk[N];
	}
}