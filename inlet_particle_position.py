#Inlet particle positions
import numpy as np
noOfPositions = 10000
xConst = -0.055
# Radius of the circle in the y–z plane (inlet)
R = 0.003
xRound = 6
yRound = 6
zRound = 6
# Open the output file for writing
with open('#enter_path', 'w') as file:
file.write('(\n')
for _ in range(noOfPositions):
# Sample angle uniformly [0, 2π)
theta = np.random.uniform(0, 2*np.pi)
# Sample radius so area is uniform: √U * R
r = R * np.sqrt(np.random.rand())
# Convert to Cartesian in y–z plane
yRand = np.round(r * np.cos(theta), yRound)
zRand = np.round(r * np.sin(theta), zRound)
xRand = np.round(xConst, xRound)
file.write(f'({xRand} {yRand} {zRand})\n')
file.write(')\n')
