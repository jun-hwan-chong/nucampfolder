# %%
import numpy
from matplotlib import pyplot

# %%
num = 20
data = numpy.random.rand(4, num)
print(data)

# %%
pyplot.scatter(data[0], data[1], c=data[2], s=data[3]
               * 1000, alpha=0.3, cmap='viridis')
pyplot.colorbar()

# %%
num = 500
data = numpy.random.rand(num, num)
pyplot.imshow(data, cmap='binary')
