import sys
from sklearn.linear_model import LinearRegression
import pandas
import coremltools
data = pandas.read_csv("surfs.csv")

model = LinearRegression()
model.fit(data[["model", "gear", "production", "condition"]], data["price"])

coreml_model = coremltools.converters.sklearn.convert(model, ["model", "gear", "production", "condition"], "price")
coreml_model.author = "Marina"
coreml_model.license = ""
coreml_model.short_description = "Predicts the price of a surfboard."
coreml_model.save("Surfs.mlmodel")

print(data)
