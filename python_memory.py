                                                                                                                                                                                               
import sys
import pandas as pd
import matplotlib.pyplot as plt
import time
import os

# Read the memory usage data from the CSV file
data = pd.read_csv(sys.argv[1])

#outout
timestamp = time.strftime("%Y-%m-%d_%H-%M-%S")
file = os.path.join("/home/bhavya/report", f"{timestamp}_memory_usage.png")
# Create a new figure and axis
fig, ax = plt.subplots()

# Plot the memory usage data
ax.plot(data.iloc[:, 0], data.iloc[:, 2], label="Memory Usage")

# Add a legend and labels to the plot
ax.legend()
ax.set_xlabel("Time (s)")
ax.set_ylabel("Memory Usage (MB)")


# Save the plot to a PNG file
plt.savefig("file")
plt.show()


