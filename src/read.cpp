
#include <cassert>
#include <iostream>

#include "defns.hpp"

using namespace std;

void read_data(const char *fname, vector<Job>& N, int& Nr_jobs, int& Nr_machs)
{
	ifstream ifs(fname);
	assert(ifs.is_open());

	ifs>>Nr_jobs>>Nr_machs;
	assert(!ifs.eof());


	N.resize(Nr_jobs);
	for(vector<Job>::iterator j=N.begin(); j!=N.end(); ++j) {
		ifs>>j->ptime>>j->setup;
		assert(!ifs.eof());
	}
}


#ifdef TEST 

int main(int argc, char *argv[])
{
	assert(argc>=2);
	vector<Job> N;
	int Nr_jobs, Nr_machs;
	read_data(argv[1], N, Nr_jobs, Nr_machs);

	cout<<Nr_jobs<<"\t"<<Nr_machs<<endl;
	for(vector<Job>::const_iterator j=N.begin(); j!=N.end(); ++j)
		cout<<j->ptime<<"\t"<<j->setup<<endl;
}

#endif
