# systrace
Analysing system calls in Android kernel source.
This was done as apart of thesis work done at Amrita Vishwa Vidyapeetham.

The script executes with an argument.  The argument corresponds to the path to the kerenl source.
The script requires the presence of a pattern.txt in the root directory of the Android source.

The script displays the nnames of the system calls along with their frequecy of occureneces.

The script also displays the total number of different system calls matched according to the pattern file.
