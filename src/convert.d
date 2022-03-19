
import std.algorithm, std.stdio, std.string, std.conv, std.format;

void main(string[] argv)
{
	int Nr_jobs, Nr_machs;
	real alpha, rho;
	ulong count=0;
	File fp=File(argv[1], "r");

	auto range = fp.byLine();
	foreach(line; range) {
		auto items=line.split();
		writeln(items);
		if(items.length==4) {
			Nr_jobs	=items[0].to!int;
			Nr_machs=items[1].to!int;
			alpha	=items[2].to!real;
			rho	=items[3].to!real;
			count	=1;
		}
		else if( items.length==2*Nr_jobs ) {
			int[] ptimes = new int[Nr_jobs];
			int[] setup  = new int[Nr_jobs];
			for(auto i=0; i<Nr_jobs; ++i) {
				ptimes[i]=items[i].to!int;
				setup[i]=items[Nr_jobs+i].to!int;
			}

			char[256] buf;
			string fname=sformat(buf, "n%dm%d-%d-a%d-r%d.dat", Nr_jobs, Nr_machs, count, to!int(10*alpha), to!int(10*rho)).to!string;
			writeln(fname);
			File fout=File(fname, "w");

			fout.writeln(Nr_jobs, "\t", Nr_machs);
			for(auto i=0; i<Nr_jobs; ++i) {
				fout.writeln(ptimes[i],"\t",setup[i]);
			}
			count++;
		}
	}
}
