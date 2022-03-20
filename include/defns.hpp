
#include <cstdlib>
#include <vector>

#ifndef __DEFNS_HPP__

#define __DEFNS_HPP__

struct Job {
	int setup;
	int ptime;
};

void read_data(const char *fname, vector<Job>& N, int& Nr_jobs, int& Nr_machs);

#endif


