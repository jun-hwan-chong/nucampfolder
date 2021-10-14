# %%
import numpy as np
import matplotlib.pyplot as plt

# %%
x1 = [1, 2, 3, 4]
y1 = [4, 5, 6, 7]
x2 = [8, 9, 10, 11]
y2 = [11, 12, 13, 14]

# %%
plt.plot(x1, y1, label='first plot')
plt.plot(x2, y2, label='second plot')
plt.legend()
# %%
num = 100
x = np.linspace(0, 20, num)
print(x)

# %%
y = np.random.rand(num)
print(y)
# %%
plt.plot(x, y)

# %%
