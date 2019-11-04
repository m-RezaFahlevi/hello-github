//I just test this file java, and try to push it to my repository

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

class testJavaFiles {
	public static void main(String[] args) {
		BufferedReader scan = new BufferedReader(new InputStreamReader(System.in));
		try {
			System.out.print("Enter the name : ");
			String theName = scan.readLine();
			System.out.println("You just enter your name : " + theName);
			System.out.print("\nEnter a number : ");
			int numbers = Integer.parseInt(scan.readLine());
			System.out.println("You just enter a number : " + numbers);
		} catch (Throwable exc) {
			System.out.println(exc); //Catch a superclass exceptions;
		}
	}
}
