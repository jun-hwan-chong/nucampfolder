# %%
import numpy
from matplotlib import pyplot

# %%
x = numpy.linspace(0, 2*numpy.pi, 10)
print(x)

# %%
y = numpy.sin(x)
print(y)

# %%
pyplot.plot(x, y)

# %%
resolution = 100
frequency = 2
x = numpy.linspace(0, 2*numpy.pi, resolution)
y = numpy.sin(x * frequency)
pyplot.plot(x, y)

# %%
y1 = numpy.sin(x*6)
y2 = numpy.sin(x*9)
pyplot.plot(x, y1 + y2)

# %%
