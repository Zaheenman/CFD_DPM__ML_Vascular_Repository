#### SciKit_Learn_Codes
##Import_Libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score, mean_absolute_error
##Import_Dataset
CSV_PATH = Path(" #Enter_CSV_file_path")
df = pd.read_csv(CSV_PATH)
df.columns = df.columns.str.strip()
##Train_Test_Split
X = df.drop(columns=[ ‘#specify_independent_Variables’])
y = df['#Specify_dependent_Variables’]
X_train, X_test, y_train, y_test = train_test_split(X,y,random_state=1, test_size=0.25)
##Import_ML_Models
from sklearn.ensemble import RandomForestRegressor
from sklearn.linear_model import LinearRegression
from sklearn.neighbors import KNeighborsRegressor
##Fit_Models
lr = LinearRegression()
lr.fit(X_train, y_train)
knn = KNeighborsRegressor(n_neighbors=2)
knn.fit(X_train, y_train)
rfr = RandomForestRegressor(n_estimators=10, min_samples_split=5, min_samples_leaf=2)
rfr.fit(X_train, y_train)
##Predict_outputs_(Generation_01_Predictions)
y_pred_lr = lr.predict(X_test)
y_pred_rfr = rfr.predict(X_test)
y_pred_knn = knn.predict(X_test)
#New_Inputs_(Generation_02)
new_data = pd.DataFrame([{
#Specify_Inputs_(Boundary_Conditions)
#example: 'Vin': 0.1789,'D1': 0.008, ......
}])
##Predictions_(Generation_02)
pred_lr = lr.predict(new_data)
print("Linear Regression Prediction:", pred_lr[0]) #The user can replace pred_lr[0] with a simple loop for multiple predictions
print("Random Forest Prediction:", pred_rfr[0])
pred_knn = knn.predict(new_data)
print("k-NN Prediction:", pred_knn[0])
pred_rfr = rfr.predict(new_data)
