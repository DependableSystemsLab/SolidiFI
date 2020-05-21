#!/usr/bin/python3

import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mpl
import solidifi
import os

bug_types = ['Re-entrancy','Timestamp-Dependency','Unchecked-Send','Unhandled-Exceptions','TOD','Overflow-Underflow','tx.origin']
# x axis values 
x = [ i for i in range(1,51)]
# corresponding y axis values 
time_v = []
rounds = [i for i in range(1,6)]

for cs in x:
    time_avg=0
    iter_avg=0
    for bug_type in bug_types:
        iter_avg=0
        for iter in rounds:
            time = solidifi.interior_main("-i" ,"contracts/"+str(cs)+".sol" ,bug_type)
            iter_avg=iter_avg+float(time)
        time_avg=time_avg+round(np.average(iter_avg),3)
    time_v.append(round(time_avg,3))

# plotting the points  
y_pos = np.arange(len(x))
plt.bar(x, time_v, align='center', width = 0.7, alpha=0.5)
 
  
for a,b in zip(x, time_v): 
    plt.text(a-(len(str(b))/5)/2, b+0.01, str(b), size=9)
plt.subplots_adjust(bottom= 0.1, top = 0.9, hspace=0.5)

plt.plot([0, 51], [0.15,0.15], "k--")


plt.xticks(np.arange(0, 51, step=5))


# naming the x axis 
plt.xlabel('Contracts') 
# naming the y axis 
plt.ylabel('Runtime (Sec)') 
mpl.rcParams.update({'font.size': 51})  


plt.savefig('runtime.eps', dpi=600)  
# function to show the plot 
plt.show() 

print("Average time = {0}".format(round(np.average(time_v),3)))
print("Maximum time = {0}".format(round(np.max(time_v),3)))