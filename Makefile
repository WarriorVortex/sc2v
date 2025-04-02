#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Library General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA02111-1307, USA.

SC2V = ../bin/sc2v.sh
TESTS = subbytes sc_ex1 dummy1 dummy2 delay_line stmach_k rng md5 half_adder full_adder

all:
	cd src; make all

test: 
	cd src; make all
	cd examples; \
	for arg in $(TESTS); do \
		$(SC2V) $$arg; \
	done; echo ""; echo "sc2v translated the following files successfully"; echo ""; ls -l *.v 

docs:
	cd src; doxygen doxygen.cfg 

clean:
	\rm -r docs; cd src; make clean; cd ../examples/; rm -rf *.v
