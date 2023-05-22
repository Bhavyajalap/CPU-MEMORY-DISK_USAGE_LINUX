import sys
import pandas as pd
import matplotlib.pyplot as plt
import time
import os

# Read the disk usage data from the CSV file
data = pd.read_csv(sys.argv[1])

#output
timestamp = time.strftime("%Y-%m-%d_%H-%M-%S")
file = os.path.join("/home/bhavya/report", f"{timestamp}_disk_usage.png")

# Create a new figure and axis
fig, ax = plt.subplots()

# Plot the disk usage data
ax.plot(data.iloc[:, 0], data.iloc[:, 2], label="Disk Usage")

# Add a legend and labels to the plot
ax.legend()
ax.set_xlabel("Time (s)")
ax.set_ylabel("Disk Usage (GB)")


# Save the plot to a PNG file
plt.savefig("file")
plt.show()

