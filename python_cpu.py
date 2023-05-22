import sys
import pandas as pd
import matplotlib.pyplot as plt
import time
import os

# Read the CPU usage data from the CSV file
data = pd.read_csv(sys.argv[1])

#output

timestamp = time.strftime("%Y-%m-%d_%H-%M-%S")
file = os.path.join("/home/bhavya/report", f"{timestamp}_cpu_usage.png")

# Create a new figure and axis
fig, ax = plt.subplots()

# Plot the CPU usage data for each core
for i in range(1, data.shape[1]):
    ax.plot(data.iloc[:,0], data.iloc[:,i], label=f"Core {i}")

# Add a legend and labels to the plot
ax.legend()
ax.set_xlabel("Time (s)")
ax.set_ylabel("CPU Usage (%)")

# Save the plot to a PNG file
plt.savefig("file")
plt.show()







