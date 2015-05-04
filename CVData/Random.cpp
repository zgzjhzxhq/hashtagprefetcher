// Random.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

#include <stdio.h>

#include <stdlib.h>

#include <time.h>

#include <fstream>

#include <string>

#include <iostream>

#include <cstring>


void random(int a[], int n)

{

	int index, tmp, i;

	srand(time(NULL));

	for (i = 0; i <n; i++)

	{

		index = rand() % (n - i) + i;

		if (index != i)

		{

			tmp = a[i];

			a[i] = a[index];

			a[index] = tmp;

		}

	}

}

int main()

{
	/*int a[1000];
	int check[1001];
	for (int i = 0; i < 1000; i++)
	{
		check[i + 1] = 0;
		a[i] = i + 1;
	}

	random(a, 1000);

	std::ifstream input("FreqMatrix.csv");
	std::ofstream fout("FreqCV.csv");
	std::string D[5001];
	for (int i = 1; i <= 5000; i++) {
		std::getline(input, D[i]);
		fout << D[i] << "\n";
		printf("%d\n", i);
	}
	fout.close();

	system("pause");

	return 0;*/

	std::ifstream input1("FreqCV.csv");
	std::ifstream input2("0-1CV.csv");
	std::string str;
	std::ofstream fout1("FreqTrain4.csv");
	std::ofstream fout2("0-1Train4.csv");
	std::ofstream fout3("FreqTest4.csv");
	std::ofstream fout4("0-1Test4.csv");

	int pos;
	for (int i = 0; i < 5000; i++) {
		pos = i % 1000;
		std::getline(input1, str);
		if (pos < 600 || pos >= 800)
			fout1 << str << "\n";
		else
			fout3 << str << "\n";

		std::getline(input2, str);
		if (pos < 600 || pos >= 800)
			fout2 << str << "\n";
		else
			fout4 << str << "\n";
	}

	fout1.close();
	fout2.close();
	fout3.close();
	fout4.close();

	system("pause");

	return 0;
}

