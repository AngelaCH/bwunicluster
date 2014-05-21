// Includes
#include <iostream>
#include <cstdlib>	// EXIT_SUCCESS|FAILURE
#include <cmath>	// sqrt etc.

// -> Header for STL's time module
#include <chrono>

// -> OpenMP
#include <omp.h>


// Typedefs/Aliases
typedef std::chrono::high_resolution_clock Clock;
typedef std::chrono::time_point<Clock> TimePoint;
typedef TimePoint::duration Duration;
typedef std::chrono::duration<double> DoubleSeconds;


double test1(ulong iterations) {
	double sum = 0;
	for (uint i=1; i<iterations; ++i)
		sum += sqrt(i) / i;
	return sum;
}

double test2(ulong iterations) {
	// set the number of threads
	// TODO: use the number of assigned processords (MOAB_PROCCOUNT)
	omp_set_num_threads(4);
	std::cout << "Using " << omp_get_max_threads() << " threads" << std::endl;

	double sum = 0;
	double temp;
	#pragma omp parallel for reduction(+:sum) private(temp)
	for (uint i=1; i<iterations; ++i) {
		temp = sqrt(i) / i;

		sum += temp;
	}
	return sum;
}

// Main Entry Point
int main(int argc, char* argv[]) {
	// parse arguments
	if(argc < 2) {
		std::cout << "Usage: " << argv[0] << " [#iterations]" << std::endl;
		return EXIT_FAILURE;
	}
	uint iterations = std::stoi(argv[1]);


	// start benchmark
	// -> initialize benchmark
	std::cout << "Starting Benchmark..." << std::endl;
	const TimePoint timeStart = Clock::now();

	// -> code to benchmark
	double result;
	// result = test1(iterations);
	result = test2(iterations); // OpenMP version

	// -> end benchmark
	const TimePoint timeEnd = Clock::now();
	DoubleSeconds duration = std::chrono::duration_cast<DoubleSeconds>(timeEnd - timeStart);

	std::cout << "Time elapsed: " << duration.count() << " sec" << std::endl;
	std::cout << "Result: " << result << std::endl;

	return EXIT_SUCCESS;
}

