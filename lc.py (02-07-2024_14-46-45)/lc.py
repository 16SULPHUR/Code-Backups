import pandas as pd

df = pd.read_excel('sample.xls')

x = df['x'].tolist()
y = df['y'].tolist()

x_mean = sum(x) / len(x)
y_mean = sum(y) / len(y)

numerator = sum((x[i] - x_mean) * (y[i] - y_mean) for i in range(len(x)))
denominator = sum((x[i] - x_mean) ** 2 for i in range(len(x)))

m = numerator / denominator

print(m)

c = y_mean - m * x_mean

# Add c to a new column 'c' in the dataframe
df['c'] = m * df['x'] + c

# Print the dataframe with the new column
print(df)